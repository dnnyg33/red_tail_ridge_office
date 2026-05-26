import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:csv/csv.dart';

import 'package:red_tail_ridge_office/payroll/models/schedule_assignments.dart';
import 'package:red_tail_ridge_office/payroll/models/worker_ntt.dart';

class NttTrackingCsvParser {
  const NttTrackingCsvParser();

  static const int _ttName = 0;
  static const int _ttDate = 1;
  static const int _ttClockIn = 5;
  static const int _ttClockOut = 6;
  static const int _ttTotalTime = 8;

  static const int _nttDate = 0;
  static const int _nttProperty = 2;
  static const int _nttEmployee = 8;
  static const int _nttStart = 9;
  static const int _nttEnd = 10;
  static const int _nttTime = 11;

  List<WorkerNtt> parse({
    required Uint8List nttBytes,
    required Uint8List timeTrackingBytes,
    ScheduleAssignments? assignments,
  }) {
    final shiftsByWorker = _parseShifts(timeTrackingBytes);
    final tasksByWorker = _parseTasks(nttBytes);

    final workers = <WorkerNtt>[];
    for (final entry in shiftsByWorker.entries) {
      final workerName = entry.key;
      final shifts = [...entry.value]..sort((a, b) {
        final dateCmp = a.date.compareTo(b.date);
        if (dateCmp != 0) return dateCmp;
        return (_parseHhMm(a.clockIn) ?? 0)
            .compareTo(_parseHhMm(b.clockIn) ?? 0);
      });
      final tasks = tasksByWorker[workerName] ?? const <_Task>[];

      final nttRows = <ProposedNttRow>[];
      var totalNttMinutes = 0;
      for (final shift in shifts) {
        final attribution = _attributeTasks(
          shift,
          tasks,
          worker: workerName,
          assignments: assignments,
        );
        final propertyCount = attribution.properties.length;
        var driveTime = max(0, propertyCount - 1) * 10;
        final assignedTaskCount = assignments?.taskCountFor(
              worker: workerName,
              date: shift.date,
            ) ??
            0;
        final taskSwitchingTime = max(0, assignedTaskCount - 1);
        final proposedNtt = shift.minutes -
            (attribution.taskMinutes + driveTime + taskSwitchingTime);
        final math = '${shift.minutes} st - (${attribution.taskMinutes} tt'
            ' + $driveTime dt + $taskSwitchingTime ts) = $proposedNtt';
        totalNttMinutes += proposedNtt;
        nttRows.add(ProposedNttRow(
          date: shift.date,
          shiftTotalTime: _formatMinutes(shift.minutes),
          tasksTotalTime: _formatMinutes(attribution.taskMinutes),
          properties: propertyCount,
          proposedNTT: proposedNtt,
          shift: TimePair(first: shift.clockIn, last: shift.clockOut),
          tasks: TimePair(
            first: attribution.firstStart,
            last: attribution.lastEnd,
          ),
          inadvertentProperties: List.unmodifiable(
            attribution.inadvertentProperties,
          ),
          math: math,
        ));
      }
      workers.add(WorkerNtt(
        workerName: workerName,
        nttRows: nttRows,
        totalNtt: totalNttMinutes / 60.0,
      ));
    }
    return workers;
  }

  _ShiftAttribution _attributeTasks(
    _Shift shift,
    List<_Task> tasks, {
    required String worker,
    ScheduleAssignments? assignments,
  }) {
    final inMin = _parseHhMm(shift.clockIn);
    final outMin = _parseHhMm(shift.clockOut);
    final attribution = _ShiftAttribution();
    if (inMin == null || outMin == null) return attribution;
    int? firstStartMin;
    int? lastEndMin;
    for (final task in tasks) {
      if (task.date != shift.date) continue;
      final startMin = _parseHhMm(task.start);
      if (startMin == null) continue;
      if (startMin < inMin || startMin >= outMin) continue;
      attribution.taskMinutes += task.minutes;
      if (task.property.isNotEmpty) {
        final propertyAssigned = assignments == null ||
            assignments.isPropertyAssigned(
              worker: worker,
              date: shift.date,
              property: task.property,
            );
        if (propertyAssigned) {
          attribution.properties.add(task.property);
        } else if (!attribution.inadvertentProperties.contains(task.property)) {
          attribution.inadvertentProperties.add(task.property);
        }
      }
      if (firstStartMin == null || startMin < firstStartMin) {
        firstStartMin = startMin;
        attribution.firstStart = task.start;
      }
      final endMin = _parseHhMm(task.end);
      if (endMin != null && (lastEndMin == null || endMin > lastEndMin)) {
        lastEndMin = endMin;
        attribution.lastEnd = task.end;
      }
    }
    return attribution;
  }

  Map<String, List<_Shift>> _parseShifts(Uint8List bytes) {
    final rows = _decode(bytes);
    final result = <String, List<_Shift>>{};
    String? currentWorker;
    for (final row in rows) {
      if (row.isEmpty) continue;
      final name = _asString(_safeGet(row, _ttName)).trim();
      if (name.isNotEmpty) {
        if (name == 'TOTALS' || name.startsWith('SEP=')) {
          currentWorker = null;
          continue;
        }
        currentWorker = name;
        result.putIfAbsent(currentWorker, () => <_Shift>[]);
      } else if (currentWorker != null) {
        final date = _asString(_safeGet(row, _ttDate)).trim();
        if (!_isDate(date)) continue;
        final minutes = _parseHhMm(_asString(_safeGet(row, _ttTotalTime)));
        if (minutes == null) continue;
        final clockIn = _asString(_safeGet(row, _ttClockIn)).trim();
        final clockOut = _asString(_safeGet(row, _ttClockOut)).trim();
        result[currentWorker]!.add(_Shift(
          date: date,
          minutes: minutes,
          clockIn: clockIn,
          clockOut: clockOut,
        ));
      }
    }
    return result;
  }

  Map<String, List<_Task>> _parseTasks(Uint8List bytes) {
    final rows = _decode(bytes);
    final result = <String, List<_Task>>{};
    for (final row in rows) {
      if (row.isEmpty) continue;
      final date = _asString(_safeGet(row, _nttDate)).trim();
      if (!_isDate(date)) continue;
      final employee = _asString(_safeGet(row, _nttEmployee)).trim();
      if (employee.isEmpty) continue;
      final taskMinutes =
          _parseHhMm(_asString(_safeGet(row, _nttTime))) ?? 0;
      final property = _asString(_safeGet(row, _nttProperty)).trim();
      final start = _asString(_safeGet(row, _nttStart)).trim();
      final end = _asString(_safeGet(row, _nttEnd)).trim();
      result.putIfAbsent(employee, () => <_Task>[]).add(_Task(
        date: date,
        start: start,
        end: end,
        minutes: taskMinutes,
        property: property,
      ));
    }
    return result;
  }

  List<List<dynamic>> _decode(Uint8List bytes) {
    final raw = utf8.decode(bytes, allowMalformed: true);
    final normalized = raw.replaceAll('\r\n', '\n').replaceAll('\r', '\n');
    return const CsvToListConverter(eol: '\n', shouldParseNumbers: false)
        .convert(normalized);
  }

  Object? _safeGet(List<dynamic> row, int index) =>
      index < row.length ? row[index] : null;

  String _asString(Object? value) => value?.toString() ?? '';

  bool _isDate(String s) {
    if (s.isEmpty) return false;
    final parts = s.split('/');
    if (parts.length != 3) return false;
    return parts.every((p) => int.tryParse(p.trim()) != null);
  }

  int? _parseHhMm(String value) {
    var s = value.trim().toUpperCase();
    if (s.isEmpty) return null;
    int? meridiemOffset;
    if (s.endsWith('AM')) {
      meridiemOffset = 0;
      s = s.substring(0, s.length - 2).trim();
    } else if (s.endsWith('PM')) {
      meridiemOffset = 12;
      s = s.substring(0, s.length - 2).trim();
    }
    final parts = s.split(':');
    if (parts.length != 2) return null;
    var h = int.tryParse(parts[0].trim());
    final m = int.tryParse(parts[1].trim());
    if (h == null || m == null) return null;
    if (meridiemOffset != null) {
      if (h < 1 || h > 12) return null;
      h = (h % 12) + meridiemOffset;
    }
    return h * 60 + m;
  }

  String _formatMinutes(int totalMinutes) {
    final isNegative = totalMinutes < 0;
    final abs = totalMinutes.abs();
    final hours = abs ~/ 60;
    final minutes = abs % 60;
    return '${isNegative ? '-' : ''}$hours:${minutes.toString().padLeft(2, '0')}';
  }
}

class _Shift {
  _Shift({
    required this.date,
    required this.minutes,
    required this.clockIn,
    required this.clockOut,
  });

  final String date;
  final int minutes;
  final String clockIn;
  final String clockOut;
}

class _Task {
  _Task({
    required this.date,
    required this.start,
    required this.end,
    required this.minutes,
    required this.property,
  });

  final String date;
  final String start;
  final String end;
  final int minutes;
  final String property;
}

class _ShiftAttribution {
  int taskMinutes = 0;
  final Set<String> properties = <String>{};
  final List<String> inadvertentProperties = <String>[];
  String firstStart = '';
  String lastEnd = '';
}
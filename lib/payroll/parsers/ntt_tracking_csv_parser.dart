import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:csv/csv.dart';

import 'package:red_tail_ridge_office/payroll/models/schedule_assignments.dart';
import 'package:red_tail_ridge_office/payroll/models/worker_ntt.dart';
import 'package:red_tail_ridge_office/payroll/models/worker_shift.dart';
import 'package:red_tail_ridge_office/payroll/models/worker_task.dart';

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

  /// CSV entry point: parse shifts from the time-tracking CSV, then compute.
  List<WorkerNtt> parse({
    required Uint8List nttBytes,
    required Uint8List timeTrackingBytes,
    ScheduleAssignments? assignments,
  }) {
    return computeFromShifts(
      shiftsByWorker: _parseShifts(timeTrackingBytes),
      tasksByWorker: _parseTasks(nttBytes),
      assignments: assignments,
    );
  }

  /// Computes proposed NTT for each worker from already-parsed [shiftsByWorker]
  /// and [tasksByWorker] (both keyed by worker name). Lets the data come from a
  /// non-CSV source (e.g. the Operto API) while reusing this logic.
  List<WorkerNtt> computeFromShifts({
    required Map<String, List<WorkerShift>> shiftsByWorker,
    required Map<String, List<WorkerTask>> tasksByWorker,
    ScheduleAssignments? assignments,
    bool checkAssignedProperties = true,
  }) {

    final workers = <WorkerNtt>[];
    for (final entry in shiftsByWorker.entries) {
      final workerName = entry.key;
      final shifts = [...entry.value]..sort((a, b) {
        final dateCmp = a.date.compareTo(b.date);
        if (dateCmp != 0) return dateCmp;
        return (_parseHhMm(a.clockIn) ?? 0)
            .compareTo(_parseHhMm(b.clockIn) ?? 0);
      });
      final tasks = tasksByWorker[workerName] ?? const <WorkerTask>[];

      // Properties the worker actually visited each day (from their task
      // times). Intersecting these with the schedule decides which properties
      // count toward drive time.
      final visitedPropertiesByDate = <String, Set<String>>{};
      for (final task in tasks) {
        if (task.property.isNotEmpty) {
          visitedPropertiesByDate
              .putIfAbsent(task.date, () => <String>{})
              .add(task.property);
        }
      }

      final nttRows = <ProposedNttRow>[];
      var totalNttMinutes = 0;
      final datesWithDailyCharge = <String>{};
      for (final shift in shifts) {
        final attribution = _attributeTasks(
          shift,
          tasks,
          worker: workerName,
          assignments: assignments,
          checkAssignedProperties: checkAssignedProperties,
        );
        final propertyCount = attribution.properties.length;
        // Drive time and task-switching leeway are daily totals from the
        // schedule, so only attribute them to the first shift of the day.
        final isFirstShiftOfDay = datesWithDailyCharge.add(shift.date);
        final driveTime = !isFirstShiftOfDay
            ? 0
            : assignments?.driveTimeFor(
                  worker: workerName,
                  date: shift.date,
                  visitedProperties: visitedPropertiesByDate[shift.date],
                ) ??
                max(0, propertyCount - 1) * 10;
        final assignedTaskCount = !isFirstShiftOfDay
            ? 0
            : assignments?.taskCountFor(
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
    WorkerShift shift,
    List<WorkerTask> tasks, {
    required String worker,
    ScheduleAssignments? assignments,
    bool checkAssignedProperties = true,
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
        final propertyAssigned = !checkAssignedProperties ||
            assignments == null ||
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

  Map<String, List<WorkerShift>> _parseShifts(Uint8List bytes) {
    final rows = _decode(bytes);
    final result = <String, List<WorkerShift>>{};
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
        result.putIfAbsent(currentWorker, () => <WorkerShift>[]);
      } else if (currentWorker != null) {
        final date = _asString(_safeGet(row, _ttDate)).trim();
        if (!_isDate(date)) continue;
        final minutes = _parseHhMm(_asString(_safeGet(row, _ttTotalTime)));
        if (minutes == null) continue;
        final clockIn = _asString(_safeGet(row, _ttClockIn)).trim();
        final clockOut = _asString(_safeGet(row, _ttClockOut)).trim();
        result[currentWorker]!.add(WorkerShift(
          date: date,
          minutes: minutes,
          clockIn: clockIn,
          clockOut: clockOut,
        ));
      }
    }
    return result;
  }

  Map<String, List<WorkerTask>> _parseTasks(Uint8List bytes) {
    final rows = _decode(bytes);
    final result = <String, List<WorkerTask>>{};
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
      result.putIfAbsent(employee, () => <WorkerTask>[]).add(WorkerTask(
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

class _ShiftAttribution {
  int taskMinutes = 0;
  final Set<String> properties = <String>{};
  final List<String> inadvertentProperties = <String>[];
  String firstStart = '';
  String lastEnd = '';
}
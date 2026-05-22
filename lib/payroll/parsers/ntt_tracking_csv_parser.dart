import 'dart:convert';
import 'dart:typed_data';

import 'package:csv/csv.dart';

import 'package:red_tail_ridge_office/payroll/models/worker_ntt.dart';

class NttTrackingCsvParser {
  const NttTrackingCsvParser();

  static const int _ttName = 0;
  static const int _ttDate = 1;
  static const int _ttTotalTime = 8;

  static const int _nttDate = 0;
  static const int _nttProperty = 2;
  static const int _nttEmployee = 8;
  static const int _nttTime = 11;

  List<WorkerNtt> parse({
    required Uint8List nttBytes,
    required Uint8List timeTrackingBytes,
  }) {
    final shiftsByWorker = _parseShifts(timeTrackingBytes);
    final tasksByWorker = _parseTasks(nttBytes);

    final workers = <WorkerNtt>[];
    for (final entry in shiftsByWorker.entries) {
      final workerName = entry.key;
      final shiftsByDate = entry.value;
      final dates = shiftsByDate.keys.toList()..sort();

      final nttRows = <ProposedNttRow>[];
      var totalNttMinutes = 0;
      for (final date in dates) {
        final shiftMinutes = shiftsByDate[date]!;
        final taskAggregate = tasksByWorker[workerName]?[date];
        final taskMinutes = taskAggregate?.minutes ?? 0;
        final propertyCount = taskAggregate?.properties.length ?? 0;
        final proposedNtt = shiftMinutes - (taskMinutes + ((propertyCount - 1) * 10));
        totalNttMinutes += proposedNtt;
        nttRows.add(ProposedNttRow(
          date: date,
          shiftTotalTime: _formatMinutes(shiftMinutes),
          tasksTotalTime: _formatMinutes(taskMinutes),
          properties: propertyCount,
          proposedNTT: proposedNtt,
          shift: shi
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

  Map<String, Map<String, int>> _parseShifts(Uint8List bytes) {
    final rows = _decode(bytes);
    final result = <String, Map<String, int>>{};
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
        result.putIfAbsent(currentWorker, () => <String, int>{});
      } else if (currentWorker != null) {
        final date = _asString(_safeGet(row, _ttDate)).trim();
        if (!_isDate(date)) continue;
        final minutes = _parseHhMm(_asString(_safeGet(row, _ttTotalTime)));
        if (minutes == null) continue;
        final byDate = result[currentWorker]!;
        byDate[date] = (byDate[date] ?? 0) + minutes;
      }
    }
    return result;
  }

  Map<String, Map<String, _TaskAggregate>> _parseTasks(Uint8List bytes) {
    final rows = _decode(bytes);
    final result = <String, Map<String, _TaskAggregate>>{};
    for (final row in rows) {
      if (row.isEmpty) continue;
      final date = _asString(_safeGet(row, _nttDate)).trim();
      if (!_isDate(date)) continue;
      final employee = _asString(_safeGet(row, _nttEmployee)).trim();
      if (employee.isEmpty) continue;
      final taskMinutes =
          _parseHhMm(_asString(_safeGet(row, _nttTime))) ?? 0;
      final property = _asString(_safeGet(row, _nttProperty)).trim();
      final byDate =
          result.putIfAbsent(employee, () => <String, _TaskAggregate>{});
      final agg = byDate.putIfAbsent(date, _TaskAggregate.new);
      agg.minutes += taskMinutes;
      if (property.isNotEmpty) agg.properties.add(property);
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
    final s = value.trim();
    if (s.isEmpty) return null;
    final parts = s.split(':');
    if (parts.length != 2) return null;
    final h = int.tryParse(parts[0].trim());
    final m = int.tryParse(parts[1].trim());
    if (h == null || m == null) return null;
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

class _TaskAggregate {
  int minutes = 0;
  final Set<String> properties = <String>{};
}

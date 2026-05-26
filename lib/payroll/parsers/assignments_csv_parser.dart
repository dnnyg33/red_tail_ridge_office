import 'dart:convert';
import 'dart:typed_data';

import 'package:csv/csv.dart';

import '../models/schedule_assignments.dart';

class AssignmentsCsvParser {
  const AssignmentsCsvParser();

  static const int _date = 0;
  static const int _property = 3;
  static const int _task = 5;
  static const int _worker = 6;

  ScheduleAssignments parse(Uint8List bytes) {
    final rows = _decode(bytes);
    final assignments = <Assignment>[];
    for (final row in rows) {
      if (row.isEmpty) continue;
      final date = _asString(_safeGet(row, _date)).trim();
      if (!_isDate(date)) continue;
      final workerCell = _asString(_safeGet(row, _worker));
      final workers = workerCell
          .split(',')
          .map((w) => w.trim())
          .where((w) => w.isNotEmpty);
      if (workers.isEmpty) continue;
      final property = _asString(_safeGet(row, _property)).trim();
      if (property.isEmpty) continue;
      final task = _asString(_safeGet(row, _task)).trim();
      for (final worker in workers) {
        assignments.add(Assignment(
          worker: worker,
          date: date,
          property: property,
          task: task,
        ));
      }
    }
    return ScheduleAssignments(assignments);
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
}

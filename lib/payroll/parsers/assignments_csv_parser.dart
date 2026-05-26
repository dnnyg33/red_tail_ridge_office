import 'dart:convert';
import 'dart:typed_data';

import 'package:csv/csv.dart';

class AssignmentsCsvParser {
  const AssignmentsCsvParser();

  static const int _date = 0;
  static const int _property = 3;
  static const int _worker = 6;

  /// Returns assigned properties keyed by worker name, then by date string
  /// (matching the date format used elsewhere in the payroll parsers).
  Map<String, Map<String, Set<String>>> parse(Uint8List bytes) {
    final rows = _decode(bytes);
    final result = <String, Map<String, Set<String>>>{};
    for (final row in rows) {
      if (row.isEmpty) continue;
      final date = _asString(_safeGet(row, _date)).trim();
      if (!_isDate(date)) continue;
      final worker = _asString(_safeGet(row, _worker)).trim();
      if (worker.isEmpty) continue;
      final property = _asString(_safeGet(row, _property)).trim();
      if (property.isEmpty) continue;
      result
          .putIfAbsent(worker, () => <String, Set<String>>{})
          .putIfAbsent(date, () => <String>{})
          .add(property);
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
}

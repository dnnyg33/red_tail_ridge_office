import 'dart:convert';
import 'dart:typed_data';

import 'package:csv/csv.dart';

import '../models/worker_ntt.dart';
import '../models/worker_row.dart';

/// Parses an Operto Teams "Time Track Days" CSV export.
///
/// The file's first row is the Excel `SEP=,` hint, the second row is the
/// column header, and the third row is the `TOTALS` summary. Each worker
/// summary row (name in column A) is followed by daily detail rows whose
/// column A is empty and column B (Date/Days) holds a date like `2026/05/11`.
/// We aggregate those detail dates to compute the worker's date range.
class TimeTrackingCsvParser {
  const TimeTrackingCsvParser();

  static const int _colName = 0;
  static const int _colDateOrDays = 1;
  static const int _colMileageTotal = 4;
  static const int _colTotalTimeHours = 9;
  static const int _colPayRate = 12;
  static const int _colPay = 13;

  List<WorkerRow> parse({
    required Uint8List bytes,
    required double mileageConstant,
    required List<WorkerNtt> workerNtts,
  }) {
    final raw = utf8.decode(bytes, allowMalformed: true);
    final normalized = raw.replaceAll('\r\n', '\n').replaceAll('\r', '\n');
    final rows = const CsvToListConverter(
      eol: '\n',
      shouldParseNumbers: false,
    ).convert(normalized);

    final result = <WorkerRow>[];
    _PendingWorker? pending;

    void flush() {
      if (pending != null) {
        result.add(pending!.build(mileageConstant));
        pending = null;
      }
    }

    for (final row in rows) {
      if (row.isEmpty) continue;
      final name = _asString(_safeGet(row, _colName)).trim();

      if (name.isNotEmpty) {
        if (name == 'TOTALS' || name.startsWith('SEP=')) continue;
        flush();
        pending = _PendingWorker(
          name: name,
          mileageTotal: _asDouble(_safeGet(row, _colMileageTotal)),
          totalTimeHours: _asDouble(_safeGet(row, _colTotalTimeHours)),
          payRate: _asDouble(_safeGet(row, _colPayRate)),
          pay: _asDouble(_safeGet(row, _colPay)),
          workerNtts: workerNtts,
        );
      } else if (pending != null) {
        final date = _parseDate(_asString(_safeGet(row, _colDateOrDays)));
        if (date != null) pending!.addDate(date);
      }
    }
    flush();
    return result;
  }

  Object? _safeGet(List<dynamic> row, int index) =>
      index < row.length ? row[index] : null;

  String _asString(Object? value) => value?.toString() ?? '';

  double _asDouble(Object? value) {
    if (value == null) return 0.0;
    final s = value.toString().trim();
    if (s.isEmpty) return 0.0;
    return double.tryParse(s) ?? 0.0;
  }

  DateTime? _parseDate(String value) {
    final s = value.trim();
    if (s.isEmpty) return null;
    final parts = s.split('/');
    if (parts.length != 3) return null;
    final year = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final day = int.tryParse(parts[2]);
    if (year == null || month == null || day == null) return null;
    return DateTime(year, month, day);
  }
}

class _PendingWorker {
  _PendingWorker({
    required this.name,
    required this.mileageTotal,
    required this.totalTimeHours,
    required this.payRate,
    required this.pay,
    required this.workerNtts,
  });

  final String name;
  final double mileageTotal;
  final double totalTimeHours;
  final double payRate;
  final double pay;
  final List<WorkerNtt> workerNtts;

  DateTime? earliest;
  DateTime? latest;

  void addDate(DateTime date) {
    if (earliest == null || date.isBefore(earliest!)) earliest = date;
    if (latest == null || date.isAfter(latest!)) latest = date;
  }

  WorkerRow build(double mileageConstant) {
    final workerNtt = workerNtts.firstWhere((w) => w.workerName == name);
    final periodBreaks = workerNtt.totalNtt;
    return WorkerRow(
      worker: name,
      periodHours: totalTimeHours,
      mileageForPeriod: mileageTotal,
      payRate: payRate,
    periodHourlyPay: pay - periodBreaks * payRate,
      mileagePay: mileageTotal * mileageConstant,
      periodStart: earliest,
      periodEnd: latest,
      periodBreaks: periodBreaks.toStringAsFixed(2),
      periodNtt: periodBreaks,
      nttRows: workerNtt.nttRows,
    );
  }
}
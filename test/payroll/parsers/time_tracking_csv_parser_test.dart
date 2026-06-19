import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:red_tail_ridge_office/payroll/models/worker_ntt.dart';
import 'package:red_tail_ridge_office/payroll/parsers/time_tracking_csv_parser.dart';

Uint8List _bytes(String s) => Uint8List.fromList(utf8.encode(s));

/// Zero-NTT entries so [TimeTrackingCsvParser.parse] can resolve each worker
/// without altering the pay math under test.
List<WorkerNtt> _ntts(List<String> names) => [
      for (final name in names)
        WorkerNtt(workerName: name, nttRows: const [], totalNtt: 0),
    ];

void main() {
  group('TimeTrackingCsvParser', () {
    const parser = TimeTrackingCsvParser();

    test('returns an empty list for empty input', () {
      expect(
        parser.parse(
          bytes: _bytes(''),
          mileageConstant: 1.0,
          workerNtts: const [],
        ),
        isEmpty,
      );
    });

    test('parses a worker row, dates, and computes mileage pay', () {
      const csv = '''SEP=,
,Date/Days,MileageIn,MileageOut,MileageTotal,ClockIn,ClockOut,TimeZone,Total Time (hh:mm),Total Time Hours,Average per Day (hh:mm), Average per Day Hours,Pay Rate,Pay,Note
TOTALS,2 Days,,,10,,,,5:00,5.00,2:30,2.50
"Alice",2 Days,,,10,,,,4:00,4.00,2:00,2.00,20.00,80.00,""
,2026/05/01,,,5,9:00AM,11:00AM,PDT,2:00,2.00,,,20.00,40.00,""
,2026/05/03,,,5,9:00AM,11:00AM,PDT,2:00,2.00,,,20.00,40.00,""
''';

      final rows = parser.parse(
        bytes: _bytes(csv),
        mileageConstant: 0.5,
        workerNtts: _ntts(['Alice']),
      );

      expect(rows, hasLength(1));
      final alice = rows.single;
      expect(alice.worker, 'Alice');
      expect(alice.periodHours, 4.00);
      expect(alice.mileageForPeriod, 10.0);
      expect(alice.payRate, 20.0);
      expect(alice.periodHourlyPay, 80.0);
      expect(alice.mileagePay, 5.0);
      expect(alice.totalPeriodPay, 85.0);
      expect(alice.periodStart, DateTime(2026, 5, 1));
      expect(alice.periodEnd, DateTime(2026, 5, 3));
    });

    test('skips TOTALS row and parses multiple workers in order', () {
      const csv = '''SEP=,
,Date/Days,MileageIn,MileageOut,MileageTotal,ClockIn,ClockOut,TimeZone,Total Time (hh:mm),Total Time Hours,Average per Day (hh:mm), Average per Day Hours,Pay Rate,Pay,Note
TOTALS,3 Days,,,10,,,,5:00,5.00,2:30,2.50
"Alice",2 Days,,,10,,,,4:00,4.00,2:00,2.00,20.00,80.00,""
,2026/05/01,,,5,9:00AM,11:00AM,PDT,2:00,2.00,,,20.00,40.00,""
"Bob",1 Days,,,,,,,1:00,1.00,1:00,1.00,15.00,15.00,""
,2026/05/02,,,,10:00AM,11:00AM,PDT,1:00,1.00,,,15.00,15.00,""
''';

      final rows = parser.parse(
        bytes: _bytes(csv),
        mileageConstant: 1.0,
        workerNtts: _ntts(['Alice', 'Bob']),
      );

      expect(rows.map((r) => r.worker).toList(), ['Alice', 'Bob']);
      expect(rows[1].mileageForPeriod, 0.0);
      expect(rows[1].mileagePay, 0.0);
      expect(rows[1].periodStart, DateTime(2026, 5, 2));
      expect(rows[1].periodEnd, DateTime(2026, 5, 2));
    });

    test('handles \\r\\n line endings', () {
      final csv = 'SEP=,\r\n'
          ',Date/Days,MileageIn,MileageOut,MileageTotal,ClockIn,ClockOut,TimeZone,Total Time (hh:mm),Total Time Hours,Average per Day (hh:mm), Average per Day Hours,Pay Rate,Pay,Note\r\n'
          'TOTALS,1 Days,,,5,,,,1:00,1.00,1:00,1.00\r\n'
          '"Alice",1 Days,,,5,,,,1:00,1.00,1:00,1.00,20.00,20.00,""\r\n'
          ',2026/05/01,,,5,9:00AM,10:00AM,PDT,1:00,1.00,,,20.00,20.00,""\r\n';

      final rows = parser.parse(
        bytes: _bytes(csv),
        mileageConstant: 1.0,
        workerNtts: _ntts(['Alice']),
      );

      expect(rows, hasLength(1));
      expect(rows.first.worker, 'Alice');
      expect(rows.first.mileagePay, 5.0);
    });

    test('worker row with no detail rows has null date range', () {
      const csv = '''SEP=,
,Date/Days,MileageIn,MileageOut,MileageTotal,ClockIn,ClockOut,TimeZone,Total Time (hh:mm),Total Time Hours,Average per Day (hh:mm), Average per Day Hours,Pay Rate,Pay,Note
"Charlie",0 Days,,,0,,,,0:00,0.00,0:00,0.00,10.00,0.00,""
''';

      final rows = parser.parse(
        bytes: _bytes(csv),
        mileageConstant: 1.0,
        workerNtts: _ntts(['Charlie']),
      );

      expect(rows, hasLength(1));
      expect(rows.single.periodStart, isNull);
      expect(rows.single.periodEnd, isNull);
    });
  });
}
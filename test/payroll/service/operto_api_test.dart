import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:red_tail_ridge_office/payroll/service/operto_api.dart';

/// Serves [records] from every endpoint and records the query parameters of
/// each request, so a test can assert both what was asked for and what the
/// client kept.
class _Recorder {
  final queries = <Map<String, String>>[];

  OpertoApi api(List<Map<String, dynamic>> records) {
    return OpertoApi(
      client: MockClient((request) async {
        queries.add(request.url.queryParameters);
        return http.Response(
          jsonEncode({'data': records, 'has_more': false}),
          200,
          headers: {'content-type': 'application/json'},
        );
      }),
    );
  }
}

/// A StaffDayTime whose GMT [clockIn] timestamp is `YYYYMMDDHHMMSS`.
Map<String, dynamic> _dayTime(int id, String clockIn, String clockOut) => {
      'StaffDayTimeID': id,
      'StaffID': 132,
      'ClockIn': clockIn,
      'ClockOut': clockOut,
    };

void main() {
  group('OpertoApi date range', () {
    test('queries one GMT day past the end date', () async {
      final recorder = _Recorder();
      await recorder.api([]).fetchStaffDayTimes(
        authorization: 'VRS token',
        startDate: DateTime(2026, 6, 1),
        endDate: DateTime(2026, 6, 30),
      );

      expect(recorder.queries.single['StartDate'], '20260601');
      expect(recorder.queries.single['EndDate'], '20260701');
    });

    test('rolls the padded end date into the next month and year', () async {
      final recorder = _Recorder();
      await recorder.api([]).fetchStaffTaskTimes(
        authorization: 'VRS token',
        startDate: DateTime(2026, 12, 1),
        endDate: DateTime(2026, 12, 31),
      );

      expect(recorder.queries.single['EndDate'], '20270101');
    });

    test('keeps a Pacific-evening shift that falls on the next GMT day',
        () async {
      // 2026-07-01 01:30 GMT is 2026-06-30 18:30 PDT — inside the period.
      final times = await _Recorder()
          .api([_dayTime(1, '20260701013000', '20260701043000')])
          .fetchStaffDayTimes(
            authorization: 'VRS token',
            startDate: DateTime(2026, 6, 1),
            endDate: DateTime(2026, 6, 30),
          );

      expect(times.map((t) => t.id), [1]);
      expect(times.single.clockIn, DateTime(2026, 6, 30, 18, 30));
    });

    test('drops records from the extra GMT day that are outside the period',
        () async {
      // 15:00 GMT on the padded day is 08:00 PDT on July 1 — a new period.
      final times = await _Recorder()
          .api([
            _dayTime(1, '20260630160000', '20260701000000'),
            _dayTime(2, '20260701150000', '20260701230000'),
          ])
          .fetchStaffDayTimes(
            authorization: 'VRS token',
            startDate: DateTime(2026, 6, 1),
            endDate: DateTime(2026, 6, 30),
          );

      expect(times.map((t) => t.id), [1]);
    });

    test('keeps task times by their Pacific clock-in day', () async {
      final taskTimes = await _Recorder()
          .api([
            {
              'StaffTaskTimeID': 1,
              'StaffID': 132,
              'TaskID': 7,
              'ClockIn': '20260701020000',
              'ClockOut': '20260701030000',
            },
            {
              'StaffTaskTimeID': 2,
              'StaffID': 132,
              'TaskID': 8,
              'ClockIn': '20260701180000',
              'ClockOut': '20260701190000',
            },
          ])
          .fetchStaffTaskTimes(
            authorization: 'VRS token',
            startDate: DateTime(2026, 6, 1),
            endDate: DateTime(2026, 6, 30),
          );

      expect(taskTimes.map((t) => t.id), [1]);
      expect(taskTimes.single.clockIn, DateTime(2026, 6, 30, 19));
    });
  });
}

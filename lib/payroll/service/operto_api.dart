import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/staff.dart';
import '../models/staff_day_time.dart';
import '../models/staff_task.dart';
import '../models/staff_task_time.dart';

/// Thrown when an Operto data request fails. [message] is user-safe.
class OpertoApiException implements Exception {
  const OpertoApiException(this.message);
  final String message;

  @override
  String toString() => 'OpertoApiException: $message';
}

/// Reads payroll data from the Operto Teams API. Callers pass a ready
/// `Authorization` header value (e.g. `VRS <jwt>`) obtained from the auth
/// layer; this client knows nothing about how tokens are minted or refreshed.
class OpertoApi {
  OpertoApi({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  static const String _base = 'https://teams-api.operto.com/api/v1';

  /// Fetches every StaffDayTime whose clock-in falls on a Pacific calendar day
  /// in [startDate]..[endDate] (inclusive), following the `has_more`
  /// pagination flag across pages. See [_nextDay] for why the query window is
  /// a day wider than the range.
  Future<List<StaffDayTime>> fetchStaffDayTimes({
    required String authorization,
    required DateTime startDate,
    required DateTime endDate,
    int perPage = 200,
  }) async {
    final times = await _fetchAll(
      authorization: authorization,
      path: 'staffdaytimes',
      fromJson: StaffDayTime.fromJson,
      query: {
        'StartDate': _yyyymmdd(startDate),
        'EndDate': _yyyymmdd(_nextDay(endDate)),
        'Sort': 'StaffDayTimeID asc',
      },
      perPage: perPage,
    );
    return _withinPacificDays(
      times,
      startDate: startDate,
      endDate: endDate,
      timestampOf: (t) => t.clockIn ?? t.clockOut,
    );
  }

  /// Fetches every StaffTaskTime (task-level clock in/out) whose clock-in
  /// falls on a Pacific calendar day in [startDate]..[endDate] (inclusive),
  /// following `has_more` pagination. See [_nextDay] for why the query window
  /// is a day wider than the range.
  Future<List<StaffTaskTime>> fetchStaffTaskTimes({
    required String authorization,
    required DateTime startDate,
    required DateTime endDate,
    int perPage = 200,
  }) async {
    final taskTimes = await _fetchAll(
      authorization: authorization,
      path: 'stafftasktimes',
      fromJson: StaffTaskTime.fromJson,
      query: {
        'StartDate': _yyyymmdd(startDate),
        'EndDate': _yyyymmdd(_nextDay(endDate)),
        'Sort': 'StaffTaskTimeID asc',
      },
      perPage: perPage,
    );
    return _withinPacificDays(
      taskTimes,
      startDate: startDate,
      endDate: endDate,
      timestampOf: (t) => t.clockIn ?? t.clockOut,
    );
  }

  /// Fetches staff tasks (assignments) in [startDate]..[endDate], used to map a
  /// `TaskID` to its property and to read task pay.
  Future<List<StaffTask>> fetchStaffTasks({
    required String authorization,
    required DateTime startDate,
    required DateTime endDate,
    int perPage = 1000,
  }) {
    return _fetchAll(
      authorization: authorization,
      path: 'stafftasks',
      fromJson: StaffTask.fromJson,
      query: {
        'TaskStartDate': _yyyymmdd(startDate),
        'TaskEndDate': _yyyymmdd(endDate),
        'Sort': 'StaffTaskID asc',
      },
      perPage: perPage,
    );
  }

  /// Fetches all staff, used to map a `StaffID` to a worker name.
  Future<List<Staff>> fetchStaff({
    required String authorization,
    int perPage = 100,
  }) {
    return _fetchAll(
      authorization: authorization,
      path: 'staff',
      fromJson: Staff.fromJson,
      query: const {'Sort': 'StaffID asc'},
      perPage: perPage,
    );
  }

  /// Walks the `{ data: [...], has_more }` pagination for [path], decoding each
  /// record with [fromJson].
  Future<List<T>> _fetchAll<T>({
    required String authorization,
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, String> query,
    required int perPage,
  }) async {
    final results = <T>[];
    var page = 1;
    while (true) {
      final uri = Uri.parse('$_base/$path').replace(
        queryParameters: {
          ...query,
          'per_page': '$perPage',
          'page': '$page',
        },
      );

      final body = _decode(await _get(uri, authorization));
      final data = body['data'];
      if (data is! List) {
        throw const OpertoApiException('Unexpected response from Operto.');
      }
      for (final item in data) {
        if (item is Map<String, dynamic>) results.add(fromJson(item));
      }

      if (body['has_more'] != true || data.isEmpty) break;
      page++;
    }
    return results;
  }

  Future<http.Response> _get(Uri uri, String authorization) async {
    final http.Response response;
    try {
      response = await _client.get(uri, headers: {
        'Authorization': authorization,
        'Accept': 'application/json',
      });
    } catch (_) {
      throw const OpertoApiException(
        'Could not reach Operto. Check your connection.',
      );
    }
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw OpertoApiException(
        'Operto request failed (${response.statusCode}).',
      );
    }
    return response;
  }

  Map<String, dynamic> _decode(http.Response response) {
    try {
      final decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) return decoded;
    } catch (_) {
      // fall through
    }
    throw const OpertoApiException('Unexpected response from Operto.');
  }

  /// The day after [date], used as the query's `EndDate`.
  ///
  /// Operto's `StartDate`/`EndDate` filters compare against timestamps the API
  /// stores in GMT, but a pay period is a range of US Pacific calendar days
  /// (clock-ins are converted to Pacific by `parseOpertoTimestamp`). A shift
  /// that starts in the Pacific evening has already rolled over to the next GMT
  /// day, so querying with the last Pacific day as `EndDate` drops the whole
  /// evening of the final day. The API has no timezone or offset parameter, so
  /// the query asks for one extra GMT day and [_withinPacificDays] discards the
  /// surplus records by their Pacific date.
  ///
  /// One extra day suffices, and only at the end: Pacific is 7–8 hours behind
  /// GMT, so a Pacific day never spans more than two GMT days, and Pacific
  /// midnight is 07:00/08:00 GMT on the *same* day — no padding is needed at
  /// the start of the range.
  ///
  /// Built by component rather than `add(Duration(days: 1))`, which would land
  /// on the same day at 23:00 across a local DST transition.
  static DateTime _nextDay(DateTime date) =>
      DateTime(date.year, date.month, date.day + 1);

  /// Drops [records] whose Pacific timestamp falls outside the
  /// [startDate]..[endDate] days (inclusive), undoing the deliberate
  /// over-fetch described on [_nextDay]. Records [timestampOf] can't date are
  /// kept — there is nothing to judge them by, and callers already ignore
  /// records missing a clock in/out.
  static List<T> _withinPacificDays<T>(
    List<T> records, {
    required DateTime startDate,
    required DateTime endDate,
    required DateTime? Function(T) timestampOf,
  }) {
    final first = _dayOf(startDate);
    final last = _dayOf(endDate);
    final kept = <T>[];
    for (final record in records) {
      final timestamp = timestampOf(record);
      if (timestamp == null) {
        kept.add(record);
        continue;
      }
      final day = _dayOf(timestamp);
      if (day.isBefore(first) || day.isAfter(last)) continue;
      kept.add(record);
    }
    return kept;
  }

  static DateTime _dayOf(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  static String _yyyymmdd(DateTime date) {
    final y = date.year.toString().padLeft(4, '0');
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '$y$m$d';
  }
}

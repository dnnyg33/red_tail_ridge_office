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

  /// Fetches every StaffDayTime in [startDate]..[endDate], following the
  /// `has_more` pagination flag across pages.
  Future<List<StaffDayTime>> fetchStaffDayTimes({
    required String authorization,
    required DateTime startDate,
    required DateTime endDate,
    int perPage = 100,
  }) {
    return _fetchAll(
      authorization: authorization,
      path: 'staffdaytimes',
      fromJson: StaffDayTime.fromJson,
      query: {
        'StartDate': _yyyymmdd(startDate),
        'EndDate': _yyyymmdd(endDate),
        'Sort': 'StaffDayTimeID asc',
      },
      perPage: perPage,
    );
  }

  /// Fetches every StaffTaskTime in [startDate]..[endDate] (task-level clock
  /// in/out), following `has_more` pagination.
  Future<List<StaffTaskTime>> fetchStaffTaskTimes({
    required String authorization,
    required DateTime startDate,
    required DateTime endDate,
    int perPage = 100,
  }) {
    return _fetchAll(
      authorization: authorization,
      path: 'stafftasktimes',
      fromJson: StaffTaskTime.fromJson,
      query: {
        'StartDate': _yyyymmdd(startDate),
        'EndDate': _yyyymmdd(endDate),
        'Sort': 'StaffTaskTimeID asc',
      },
      perPage: perPage,
    );
  }

  /// Fetches staff tasks (assignments) in [startDate]..[endDate], used to map a
  /// `TaskID` to its property and to read task pay.
  Future<List<StaffTask>> fetchStaffTasks({
    required String authorization,
    required DateTime startDate,
    required DateTime endDate,
    int perPage = 100,
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
      // TEMP DIAGNOSTIC: dump the first raw record so we can see the real
      // field names and timestamp format Operto returns.
      if (page == 1 && data.isNotEmpty) {
        // ignore: avoid_print
        print('[OpertoApi] $path first record: ${jsonEncode(data.first)}');
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

  static String _yyyymmdd(DateTime date) {
    final y = date.year.toString().padLeft(4, '0');
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '$y$m$d';
  }
}

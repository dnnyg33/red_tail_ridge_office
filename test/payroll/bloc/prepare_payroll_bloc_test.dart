import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_utils/networking/async_operation.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:red_tail_ridge_office/auth/bloc/auth_bloc.dart';
import 'package:red_tail_ridge_office/auth/models/auth_provider.dart';
import 'package:red_tail_ridge_office/auth/models/auth_session.dart';
import 'package:red_tail_ridge_office/payroll/bloc/prepare_payroll_bloc.dart';
import 'package:red_tail_ridge_office/payroll/models/staff_day_time.dart';
import 'package:red_tail_ridge_office/payroll/models/worker_row.dart';
import 'package:red_tail_ridge_office/payroll/parsers/operto_payroll_builder.dart';
import 'package:red_tail_ridge_office/payroll/service/operto_api.dart';

/// In-memory [Storage] so the [HydratedBloc]-based [AuthBloc] is constructible
/// in tests without touching disk.
class _InMemoryStorage implements Storage {
  final _box = <String, dynamic>{};

  @override
  dynamic read(String key) => _box[key];

  @override
  Future<void> write(String key, dynamic value) async => _box[key] = value;

  @override
  Future<void> delete(String key) async => _box.remove(key);

  @override
  Future<void> clear() async => _box.clear();

  @override
  Future<void> close() async {}
}

/// [AuthBloc] that returns a fixed session, bypassing the network so the
/// payroll bloc's Operto fetches can be exercised against a mock HTTP client.
class _FakeAuthBloc extends AuthBloc {
  _FakeAuthBloc(this._session);

  final AuthSession? _session;

  @override
  Future<AuthSession?> ensureValidSession(AuthProvider provider) async =>
      _session;
}

AuthSession _operatorSession() => AuthSession(
      provider: AuthProvider.operto,
      accessToken: 'token',
      clientId: 'id',
      clientSecret: 'secret',
      obtainedAt: DateTime(2026, 6, 1),
    );

/// Routes the four Operto endpoints to canned `{ data, has_more }` payloads.
OpertoApi _mockOpertoApi() {
  final client = MockClient((request) async {
    final body = switch (request.url.path) {
      '/api/v1/staffdaytimes' => {
          'data': [
            {
              'StaffDayTimeID': 1,
              'StaffID': 132,
              'ClockIn': '20260601090000',
              'ClockOut': '20260601170000',
              'MileageIn': '100',
              'MileageOut': '110',
            },
          ],
          'has_more': false,
        },
      '/api/v1/staff' => {
          'data': [
            {'StaffID': 132, 'Name': 'Alice', 'Active': true},
          ],
          'has_more': false,
        },
      _ => {'data': <dynamic>[], 'has_more': false},
    };
    return http.Response(jsonEncode(body), 200,
        headers: {'content-type': 'application/json'});
  });
  return OpertoApi(client: client);
}

PreparePayrollBloc _buildBloc({
  AuthSession? session,
  OpertoApi? opertoApi,
}) =>
    PreparePayrollBloc(
      authBloc: _FakeAuthBloc(session),
      opertoApi: opertoApi ?? _mockOpertoApi(),
    );

void main() {
  setUpAll(() => HydratedBloc.storage = _InMemoryStorage());

  group('PreparePayrollBloc', () {
    test('initial state defaults', () {
      final state = _buildBloc().state;
      expect(state.workerRows.isIdle, isTrue);
      expect(state.staffDayTimes.isIdle, isTrue);
      expect(state.mileageConstant, 0.725);
      expect(state.payRateFile, isNull);
      expect(state.startDate, isNull);
    });

    blocTest<PreparePayrollBloc, PreparePayrollState>(
      'Started defaults the pay period and start date to the current month',
      build: _buildBloc,
      act: (bloc) => bloc.add(const PreparePayrollEvent.started()),
      verify: (bloc) {
        final now = DateTime.now();
        expect(bloc.state.startDate, DateTime(now.year, now.month, 1));
        expect(bloc.state.payPeriodStart, DateTime(now.year, now.month, 1));
        expect(bloc.state.payPeriodEnd, DateTime(now.year, now.month + 1, 0));
      },
    );

    blocTest<PreparePayrollBloc, PreparePayrollState>(
      'MileageConstantChanged sets and clears the constant',
      build: _buildBloc,
      act: (bloc) => bloc
        ..add(const PreparePayrollEvent.mileageConstantChanged(0.5))
        ..add(const PreparePayrollEvent.mileageConstantChanged(null)),
      expect: () => [
        isA<PreparePayrollState>()
            .having((s) => s.mileageConstant, 'mileageConstant', 0.5),
        isA<PreparePayrollState>()
            .having((s) => s.mileageConstant, 'mileageConstant', isNull),
      ],
    );

    blocTest<PreparePayrollBloc, PreparePayrollState>(
      'Start/End date changes feed canFetchStaffDayTimes',
      build: _buildBloc,
      act: (bloc) => bloc
        ..add(PreparePayrollEvent.startDateChanged(DateTime(2026, 6, 1)))
        ..add(PreparePayrollEvent.endDateChanged(DateTime(2026, 6, 30))),
      verify: (bloc) => expect(bloc.state.canFetchStaffDayTimes, isTrue),
    );

    blocTest<PreparePayrollBloc, PreparePayrollState>(
      'StaffDayTimesRequested without dates errors the staffDayTimes op',
      build: _buildBloc,
      act: (bloc) =>
          bloc.add(const PreparePayrollEvent.staffDayTimesRequested()),
      verify: (bloc) {
        expect(bloc.state.staffDayTimes.hasError, isTrue);
        expect(bloc.state.staffDayTimes.error, contains('start and end date'));
      },
    );

    blocTest<PreparePayrollBloc, PreparePayrollState>(
      'StaffDayTimesRequested without a session errors the staffDayTimes op',
      build: () => _buildBloc(session: null),
      seed: () => PreparePayrollState(
        startDate: DateTime(2026, 6, 1),
        endDate: DateTime(2026, 6, 30),
      ),
      act: (bloc) =>
          bloc.add(const PreparePayrollEvent.staffDayTimesRequested()),
      verify: (bloc) {
        expect(bloc.state.staffDayTimes.hasError, isTrue);
        expect(bloc.state.staffDayTimes.error, contains('Connect Operto'));
      },
    );

    blocTest<PreparePayrollBloc, PreparePayrollState>(
      'StaffDayTimesRequested fetches and stores all Operto data',
      build: () => _buildBloc(session: _operatorSession()),
      seed: () => PreparePayrollState(
        startDate: DateTime(2026, 6, 1),
        endDate: DateTime(2026, 6, 30),
      ),
      act: (bloc) =>
          bloc.add(const PreparePayrollEvent.staffDayTimesRequested()),
      verify: (bloc) {
        expect(bloc.state.staffDayTimes.isSuccess, isTrue);
        expect(bloc.state.staffDayTimes.data, hasLength(1));
        expect(bloc.state.staffNamesById, {132: 'Alice'});
        expect(bloc.state.staffTaskTimes, isEmpty);
      },
    );

    blocTest<PreparePayrollBloc, PreparePayrollState>(
      'ReportRequested without fetched data errors the workerRows op',
      build: _buildBloc,
      act: (bloc) => bloc.add(const PreparePayrollEvent.reportRequested()),
      verify: (bloc) {
        expect(bloc.state.workerRows.hasError, isTrue);
        expect(bloc.state.workerRows.error, contains('Fetch Operto data'));
      },
    );

    blocTest<PreparePayrollBloc, PreparePayrollState>(
      'ReportRequested builds worker rows and the overall pay period',
      build: _buildBloc,
      seed: () => PreparePayrollState(
        mileageConstant: 0.5,
        staffNamesById: const {132: 'Alice'},
        staffDayTimes: AsyncOperation.success(data: [
          StaffDayTime(
            id: 1,
            staffId: 132,
            clockIn: DateTime(2026, 6, 1, 9),
            clockOut: DateTime(2026, 6, 1, 17),
          ),
        ]),
      ),
      act: (bloc) => bloc.add(const PreparePayrollEvent.reportRequested()),
      verify: (bloc) {
        expect(bloc.state.workerRows.isSuccess, isTrue);
        final row = bloc.state.workerRows.data!.single;
        expect(row.worker, 'Alice');
        expect(row.periodHours, 8);
        expect(row.payRate, OpertoPayrollBuilder.defaultPayRate);
        expect(bloc.state.payPeriodStart, DateTime(2026, 6, 1, 9));
        expect(bloc.state.payPeriodEnd, DateTime(2026, 6, 1, 9));
      },
    );
  });

  group('PreparePayrollState computed properties', () {
    test('bonusPot is 3.5% of cleaning revenue less heath deductions', () {
      const state =
          PreparePayrollState(cleaningRevenue: 1000, heathDeductions: 5);
      expect(state.bonusPot, closeTo(0.035 * 1000 - 5, 1e-9));
    });

    test(
        'totalCleans includes over-time cleans and non-qualifying workers '
        '(they forfeit their share, not the pot total)', () {
      final state = PreparePayrollState(
        workerRows: AsyncOperation.success(data: const [
          WorkerRow(
            worker: 'Alice',
            periodHours: 8,
            periodBreaks: '0',
            mileageForPeriod: 0,
            payRate: 16,
            periodHourlyPay: 128,
            mileagePay: 0,
            cleans: 3,
            overTimeCleans: 1,
            qualifiesForBonus: true,
          ),
          WorkerRow(
            worker: 'Bob',
            periodHours: 8,
            periodBreaks: '0',
            mileageForPeriod: 0,
            payRate: 16,
            periodHourlyPay: 128,
            mileagePay: 0,
            cleans: 2,
            qualifiesForBonus: true,
          ),
          // Carol doesn't qualify, but her cleans still divide the pot.
          WorkerRow(
            worker: 'Carol',
            periodHours: 8,
            periodBreaks: '0',
            mileageForPeriod: 0,
            payRate: 16,
            periodHourlyPay: 128,
            mileagePay: 0,
            cleans: 5,
            qualifiesForBonus: false,
          ),
        ]),
      );
      // 3 + 1 (Alice incl. over-time) + 2 (Bob) + 5 (Carol) = 11.
      expect(state.totalCleans, 11);
    });

    test('canGenerateReport requires a successful staffDayTimes fetch', () {
      const idle = PreparePayrollState();
      expect(idle.canGenerateReport, isFalse);

      final fetched = PreparePayrollState(
        staffDayTimes: AsyncOperation.success(data: const []),
      );
      expect(fetched.canGenerateReport, isTrue);
    });
  });
}


import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_utils/networking/async_operation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/bloc/auth_bloc.dart';
import '../../auth/models/auth_provider.dart';
import '../models/pay_rate.dart';
import '../models/staff.dart';
import '../models/staff_day_time.dart';
import '../models/staff_task.dart';
import '../models/staff_task_time.dart';
import '../models/worker_row.dart';
import '../parsers/operto_payroll_builder.dart';
import '../service/operto_api.dart';

part 'prepare_payroll_bloc.freezed.dart';
part 'prepare_payroll_event.dart';
part 'prepare_payroll_state.dart';


class PreparePayrollBloc extends Bloc<PreparePayrollEvent, PreparePayrollState> {
  PreparePayrollBloc({
    required AuthBloc authBloc,
    OpertoApi? opertoApi,
  })  : _authBloc = authBloc,
        _opertoApi = opertoApi ?? OpertoApi(),
        super(const PreparePayrollState()) {
    on<_PreparePayrollStarted>(_onStarted);
    on<_PreparePayrollPayRateFileSelected>(_onPayRateFileSelected);
    on<_PreparePayrollMileageConstantChanged>(_onMileageConstantChanged);
    on<_PreparePayrollHeathDeductionsChanged>(_onHeathDeductionsChanged);
    on<_PreparePayrollCleaningRevenueChanged>(_onCleaningRevenueChanged);
    on<_PreparePayrollStartDateChanged>(_onStartDateChanged);
    on<_PreparePayrollEndDateChanged>(_onEndDateChanged);
    on<_PreparePayrollStaffDayTimesRequested>(_onStaffDayTimesRequested);
  }

  final AuthBloc _authBloc;
  final OpertoApi _opertoApi;

  void _onStarted(
    _PreparePayrollStarted event,
    Emitter<PreparePayrollState> emit,
  ) {
    final now = DateTime.now();
    emit(
      state.copyWith(
        payPeriodStart: DateTime(now.year, now.month, 1),
        payPeriodEnd: DateTime(now.year, now.month + 1, 0),
        startDate: DateTime(now.year, now.month, 1),
      ),
    );
  }

  void _onPayRateFileSelected(
    _PreparePayrollPayRateFileSelected event,
    Emitter<PreparePayrollState> emit,
  ) {
    emit(state.copyWith(payRateFile: event.file));
    _recomputeReport(emit);
  }

  void _onMileageConstantChanged(
    _PreparePayrollMileageConstantChanged event,
    Emitter<PreparePayrollState> emit,
  ) {
    emit(state.copyWith(mileageConstant: event.value));
    _recomputeReport(emit);
  }

  void _onHeathDeductionsChanged(
    _PreparePayrollHeathDeductionsChanged event,
    Emitter<PreparePayrollState> emit,
  ) {
    emit(state.copyWith(heathDeductions: event.value));
  }

  void _onCleaningRevenueChanged(
    _PreparePayrollCleaningRevenueChanged event,
    Emitter<PreparePayrollState> emit,
  ) {
    emit(state.copyWith(cleaningRevenue: event.value));
  }

  void _onStartDateChanged(
    _PreparePayrollStartDateChanged event,
    Emitter<PreparePayrollState> emit,
  ) {
    emit(state.copyWith(startDate: event.date));
  }

  void _onEndDateChanged(
    _PreparePayrollEndDateChanged event,
    Emitter<PreparePayrollState> emit,
  ) {
    emit(state.copyWith(endDate: event.date));
  }

  Future<void> _onStaffDayTimesRequested(
    _PreparePayrollStaffDayTimesRequested event,
    Emitter<PreparePayrollState> emit,
  ) async {
    final start = state.startDate;
    final end = state.endDate;
    if (start == null || end == null) {
      emit(state.copyWith(
        staffDayTimes:
            AsyncOperation.error(error: 'Pick a start and end date first.'),
      ));
      return;
    }

    final session = await _authBloc.ensureValidSession(AuthProvider.operto);
    if (session == null) {
      emit(state.copyWith(
        staffDayTimes: AsyncOperation.error(
          error: 'Connect Operto under Connections first.',
        ),
      ));
      return;
    }

    emit(state.copyWith(staffDayTimes: AsyncOperation.processing()));
    try {
      final auth = session.authorizationHeader;
      final times = await _opertoApi.fetchStaffDayTimes(
        authorization: auth,
        startDate: start,
        endDate: end,
      );
      final taskTimes = await _opertoApi.fetchStaffTaskTimes(
        authorization: auth,
        startDate: start,
        endDate: end,
      );
      final tasks = await _opertoApi.fetchStaffTasks(
        authorization: auth,
        startDate: start,
        endDate: end,
      );
      final staff = await _opertoApi.fetchStaff(authorization: auth);
      emit(state.copyWith(
        staffDayTimes: AsyncOperation.success(data: times),
        staffTaskTimes: taskTimes,
        staffTasks: tasks,
        staffNamesById: {for (final s in staff) s.id: s.name},
      ));
      _recomputeReport(emit);
    } catch (error) {
      emit(state.copyWith(
        staffDayTimes:
            AsyncOperation.error(error: 'Failed to load Operto shifts: $error'),
      ));
    }
  }

  /// Fetches every Operto staff member for the pay-rate editor. Throws an
  /// [OpertoApiException] when Operto isn't connected; otherwise propagates any
  /// underlying fetch error.
  Future<List<Staff>> fetchStaffForPayRates() async {
    final session = await _authBloc.ensureValidSession(AuthProvider.operto);
    if (session == null) {
      throw const OpertoApiException('Connect Operto under Connections first.');
    }
    return _opertoApi.fetchStaff(authorization: session.authorizationHeader);
  }

  /// Rebuilds the payroll report from the current state. Called automatically
  /// whenever an input that feeds the report changes (Operto data fetched, pay
  /// rate file uploaded, or mileage constant edited) so the table stays in sync
  /// without a "Generate report" action. No-ops until both the Operto data and
  /// a pay rate file are available — both are required to build the table — and
  /// never emits a processing state so the page doesn't flash a spinner on every
  /// keystroke.
  void _recomputeReport(Emitter<PreparePayrollState> emit) {
    final staffDayTimes = state.staffDayTimes.data;
    final payRateBytes = state.payRateFile?.bytes;
    if (staffDayTimes == null || payRateBytes == null) return;
    try {
      final payRates = _parsePayRates(payRateBytes);
      final rows = const OpertoPayrollBuilder().build(
        staffDayTimes: staffDayTimes,
        staffTaskTimes: state.staffTaskTimes,
        staffTasks: state.staffTasks,
        staffNamesById: state.staffNamesById,
        payRatesById: {
          for (final r in payRates)
            if (r.workerId != 0) r.workerId: r.payRate,
        },
        qualifiesForBonusById: {
          for (final r in payRates)
            if (r.workerId != 0) r.workerId: r.qualifiesForBonus,
        },
        mileageConstant: state.mileageConstant ?? 0,
      );

      final (overallStart, overallEnd) = _overallRange(rows);
      emit(state.copyWith(
        workerRows: AsyncOperation.success(data: rows),
        payPeriodStart: overallStart,
        payPeriodEnd: overallEnd,
      ));
    } catch (error) {
      emit(state.copyWith(
          workerRows: AsyncOperation.error(
            error: 'Failed to generate report: $error',
          )));
    }
  }

  /// Parses the uploaded pay-rate JSON: an array of objects with `name`,
  /// `payRate`, `workerId`, and optional `qualifiesForBonus`. Returns the
  /// decoded [PayRate]s; non-object entries are skipped.
  List<PayRate> _parsePayRates(Uint8List bytes) {
    final decoded = jsonDecode(utf8.decode(bytes, allowMalformed: true));
    if (decoded is! List) return const [];

    return [
      for (final item in decoded)
        if (item is Map<String, dynamic>) PayRate.fromJson(item),
    ];
  }

  (DateTime?, DateTime?) _overallRange(List<WorkerRow> rows) {
    DateTime? start;
    DateTime? end;
    for (final row in rows) {
      final s = row.periodStart;
      final e = row.periodEnd;
      if (s != null && (start == null || s.isBefore(start))) start = s;
      if (e != null && (end == null || e.isAfter(end))) end = e;
    }
    return (start, end);
  }
}

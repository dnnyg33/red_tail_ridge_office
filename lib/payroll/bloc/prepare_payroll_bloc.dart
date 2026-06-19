
import 'dart:convert';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_utils/networking/async_operation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/bloc/auth_bloc.dart';
import '../../auth/models/auth_provider.dart';
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
    on<_PreparePayrollReportRequested>(_onReportRequested);
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
      ),
    );
  }

  void _onPayRateFileSelected(
    _PreparePayrollPayRateFileSelected event,
    Emitter<PreparePayrollState> emit,
  ) {
    emit(state.copyWith(payRateFile: event.file));
  }

  void _onMileageConstantChanged(
    _PreparePayrollMileageConstantChanged event,
    Emitter<PreparePayrollState> emit,
  ) {
    emit(state.copyWith(mileageConstant: event.value));
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
    } catch (error) {
      emit(state.copyWith(
        staffDayTimes:
            AsyncOperation.error(error: 'Failed to load Operto shifts: $error'),
      ));
    }
  }

  void _onReportRequested(
    _PreparePayrollReportRequested event,
    Emitter<PreparePayrollState> emit,
  ) {
    final staffDayTimes = state.staffDayTimes.data;
    if (staffDayTimes == null) {
      emit(state.copyWith(
        workerRows: AsyncOperation.error(
            error: 'Fetch Operto data before generating the report.'),
      ));
      return;
    }
    emit(state.copyWith(workerRows: AsyncOperation.processing()));
    try {
      final payRateBytes = state.payRateFile?.bytes;
      final rows = const OpertoPayrollBuilder().build(
        staffDayTimes: staffDayTimes,
        staffTaskTimes: state.staffTaskTimes,
        staffTasks: state.staffTasks,
        staffNamesById: state.staffNamesById,
        payRatesById:
            payRateBytes == null ? const {} : _parsePayRates(payRateBytes),
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

  /// Parses the uploaded pay-rate CSV: rows of `StaffID,HourlyRate`. A header
  /// row (or any row whose first two cells aren't a number) is skipped.
  Map<int, double> _parsePayRates(Uint8List bytes) {
    final raw = utf8.decode(bytes, allowMalformed: true);
    final normalized = raw.replaceAll('\r\n', '\n').replaceAll('\r', '\n');
    final rows = const CsvToListConverter(eol: '\n', shouldParseNumbers: false)
        .convert(normalized);

    final rates = <int, double>{};
    for (final row in rows) {
      if (row.length < 2) continue;
      final id = int.tryParse('${row[0]}'.trim());
      final rate = double.tryParse('${row[1]}'.trim());
      if (id != null && rate != null) rates[id] = rate;
    }
    return rates;
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

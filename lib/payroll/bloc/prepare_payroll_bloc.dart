import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/worker_row.dart';
import '../parsers/time_tracking_csv_parser.dart';

part 'prepare_payroll_event.dart';
part 'prepare_payroll_state.dart';

class PreparePayrollBloc extends Bloc<PreparePayrollEvent, PreparePayrollState> {
  PreparePayrollBloc() : super(const PreparePayrollState()) {
    on<PreparePayrollStarted>(_onStarted);
    on<PreparePayrollTimeTrackingFileSelected>(_onTimeTrackingFileSelected);
    on<PreparePayrollMileageConstantChanged>(_onMileageConstantChanged);
    on<PreparePayrollReportRequested>(_onReportRequested);
  }

  void _onStarted(
    PreparePayrollStarted event,
    Emitter<PreparePayrollState> emit,
  ) {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, 1);
    final end = DateTime(now.year, now.month + 1, 0);
    emit(
      state.copyWith(
        status: PreparePayrollStatus.ready,
        payPeriodStart: start,
        payPeriodEnd: end,
        employeeCount: 0,
      ),
    );
  }

  void _onTimeTrackingFileSelected(
    PreparePayrollTimeTrackingFileSelected event,
    Emitter<PreparePayrollState> emit,
  ) {
    emit(
      state.copyWith(
        timeTrackingFileName: event.fileName,
        timeTrackingFilePath: event.filePath,
        timeTrackingBytes: event.bytes,
        errorMessage: null,
      ),
    );
  }

  void _onMileageConstantChanged(
    PreparePayrollMileageConstantChanged event,
    Emitter<PreparePayrollState> emit,
  ) {
    // Construct directly so a null value really clears the field — copyWith's
    // `?? this.mileageConstant` would otherwise preserve the old value.
    emit(
      PreparePayrollState(
        status: state.status,
        payPeriodStart: state.payPeriodStart,
        payPeriodEnd: state.payPeriodEnd,
        employeeCount: state.employeeCount,
        timeTrackingFileName: state.timeTrackingFileName,
        timeTrackingFilePath: state.timeTrackingFilePath,
        timeTrackingBytes: state.timeTrackingBytes,
        mileageConstant: event.value,
        workerRows: state.workerRows,
        errorMessage: state.errorMessage,
      ),
    );
  }

  void _onReportRequested(
    PreparePayrollReportRequested event,
    Emitter<PreparePayrollState> emit,
  ) {
    final bytes = state.timeTrackingBytes;
    if (bytes == null) {
      emit(state.copyWith(
        status: PreparePayrollStatus.failure,
        errorMessage: 'No time tracking file is loaded.',
      ));
      return;
    }
    emit(state.copyWith(status: PreparePayrollStatus.generating));
    try {
      final rows = const TimeTrackingCsvParser().parse(
        bytes: bytes,
        mileageConstant: state.mileageConstant ?? 0,
      );
      final (overallStart, overallEnd) = _overallRange(rows);
      emit(state.copyWith(
        status: PreparePayrollStatus.ready,
        workerRows: rows,
        employeeCount: rows.length,
        payPeriodStart: overallStart,
        payPeriodEnd: overallEnd,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: PreparePayrollStatus.failure,
        errorMessage: 'Failed to parse time tracking CSV: $error',
      ));
    }
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
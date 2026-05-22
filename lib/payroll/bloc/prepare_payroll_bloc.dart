
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_utils/networking/async_operation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/worker_row.dart';
import '../parsers/time_tracking_csv_parser.dart';

part 'prepare_payroll_bloc.freezed.dart';
part 'prepare_payroll_event.dart';
part 'prepare_payroll_state.dart';


class PreparePayrollBloc extends Bloc<PreparePayrollEvent, PreparePayrollState> {
  PreparePayrollBloc() : super(const PreparePayrollState()) {
    on<PreparePayrollStarted>(_onStarted);
    on<PreparePayrollTimeTrackingFileSelected>(_onTimeTrackingFileSelected);
    on<PreparePayrollNttFileSelected>(_onNttFileSelected);
    on<PreparePayrollMileageConstantChanged>(_onMileageConstantChanged);
    on<PreparePayrollReportRequested>(_onReportRequested);
  }

  void _onStarted(
    PreparePayrollStarted event,
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

  void _onTimeTrackingFileSelected(
    PreparePayrollTimeTrackingFileSelected event,
    Emitter<PreparePayrollState> emit,
  ) {
    emit(
      state.copyWith(
        timeTrackingFile: event.file,
      ),
    );
  }

  void _onNttFileSelected(
    PreparePayrollNttFileSelected event,
    Emitter<PreparePayrollState> emit,
  ) {
    emit(
      state.copyWith(
        nttFile: event.file,
      ),
    );
  }

  void _onMileageConstantChanged(
    PreparePayrollMileageConstantChanged event,
    Emitter<PreparePayrollState> emit,
  ) {
    emit(state.copyWith(mileageConstant: event.value));
  }

  void _onReportRequested(
    PreparePayrollReportRequested event,
    Emitter<PreparePayrollState> emit,
  ) {
    final bytes = state.timeTrackingFile?.bytes;
    if (bytes == null) {
      emit(state.copyWith(
        workerRows: AsyncOperation.error(
            error: 'No time tracking file is loaded.'),
      ));
      return;
    }
    emit(state.copyWith(workerRows: AsyncOperation.processing()));
    try {
      final rows = const TimeTrackingCsvParser().parse(
        bytes: bytes,
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
            error: 'Failed to parse time tracking CSV: $error',
          )));
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
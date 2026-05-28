part of 'prepare_payroll_bloc.dart';

@freezed
abstract class PreparePayrollState with _$PreparePayrollState {
  const PreparePayrollState._();

  const factory PreparePayrollState({
    @Default(AsyncOperation.idle()) AsyncOperation<List<WorkerRow>> workerRows,
    DateTime? payPeriodStart,
    DateTime? payPeriodEnd,
    PlatformFile? timeTrackingFile,
    PlatformFile? nttFile,
    PlatformFile? scheduleFile,
    @Default(0.725) double? mileageConstant,
  }) = _PreparePayrollState;

  bool get canGenerateReport =>
      timeTrackingFile != null && nttFile != null && scheduleFile != null && !workerRows.isProcessing;
}
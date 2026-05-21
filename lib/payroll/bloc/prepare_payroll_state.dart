part of 'prepare_payroll_bloc.dart';

enum PreparePayrollStatus { initial, loading, ready, generating, failure }

@freezed
abstract class PreparePayrollState with _$PreparePayrollState {
  const PreparePayrollState._();

  const factory PreparePayrollState({
    @Default(PreparePayrollStatus.initial) PreparePayrollStatus status,
    DateTime? payPeriodStart,
    DateTime? payPeriodEnd,
    @Default(0) int employeeCount,
    String? timeTrackingFileName,
    String? timeTrackingFilePath,
    Uint8List? timeTrackingBytes,
    String? nttFileName,
    String? nttFilePath,
    Uint8List? nttBytes,
    @Default(0.725) double? mileageConstant,
    @Default(<WorkerRow>[]) List<WorkerRow> workerRows,
    String? errorMessage,
  }) = _PreparePayrollState;

  bool get hasTimeTrackingFile => timeTrackingFileName != null;

  bool get canGenerateReport =>
      hasTimeTrackingFile && status != PreparePayrollStatus.generating;
}
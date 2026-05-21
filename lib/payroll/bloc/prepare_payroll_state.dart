part of 'prepare_payroll_bloc.dart';

enum PreparePayrollStatus { initial, loading, ready, generating, failure }

final class PreparePayrollState extends Equatable {
  const PreparePayrollState({
    this.status = PreparePayrollStatus.initial,
    this.payPeriodStart,
    this.payPeriodEnd,
    this.employeeCount = 0,
    this.timeTrackingFileName,
    this.timeTrackingFilePath,
    this.timeTrackingBytes,
    this.mileageConstant = .725,
    this.workerRows = const [],
    this.errorMessage,
  });

  final PreparePayrollStatus status;
  final DateTime? payPeriodStart;
  final DateTime? payPeriodEnd;
  final int employeeCount;
  final String? timeTrackingFileName;
  final String? timeTrackingFilePath;
  final Uint8List? timeTrackingBytes;
  final double? mileageConstant;
  final List<WorkerRow> workerRows;
  final String? errorMessage;

  bool get hasTimeTrackingFile => timeTrackingFileName != null;

  bool get canGenerateReport =>
      hasTimeTrackingFile && status != PreparePayrollStatus.generating;

  PreparePayrollState copyWith({
    PreparePayrollStatus? status,
    DateTime? payPeriodStart,
    DateTime? payPeriodEnd,
    int? employeeCount,
    String? timeTrackingFileName,
    String? timeTrackingFilePath,
    Uint8List? timeTrackingBytes,
    double? mileageConstant,
    List<WorkerRow>? workerRows,
    String? errorMessage,
  }) {
    return PreparePayrollState(
      status: status ?? this.status,
      payPeriodStart: payPeriodStart ?? this.payPeriodStart,
      payPeriodEnd: payPeriodEnd ?? this.payPeriodEnd,
      employeeCount: employeeCount ?? this.employeeCount,
      timeTrackingFileName: timeTrackingFileName ?? this.timeTrackingFileName,
      timeTrackingFilePath: timeTrackingFilePath ?? this.timeTrackingFilePath,
      timeTrackingBytes: timeTrackingBytes ?? this.timeTrackingBytes,
      mileageConstant: mileageConstant ?? this.mileageConstant,
      workerRows: workerRows ?? this.workerRows,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        payPeriodStart,
        payPeriodEnd,
        employeeCount,
        timeTrackingFileName,
        timeTrackingFilePath,
        timeTrackingBytes,
        mileageConstant,
        workerRows,
        errorMessage,
      ];
}
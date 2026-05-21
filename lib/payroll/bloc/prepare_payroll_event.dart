part of 'prepare_payroll_bloc.dart';


@freezed
sealed class PreparePayrollEvent with _$PreparePayrollEvent {
  const factory PreparePayrollEvent.started() = PreparePayrollStarted;

  const factory PreparePayrollEvent.timeTrackingFileSelected({
    required String fileName,
    String? filePath,
    Uint8List? bytes,
  }) = PreparePayrollTimeTrackingFileSelected;

  const factory PreparePayrollEvent.nttFileSelected({
    required String fileName,
    String? filePath,
    Uint8List? bytes,
  }) = PreparePayrollNttFileSelected;

  const factory PreparePayrollEvent.mileageConstantChanged(double? value) =
      PreparePayrollMileageConstantChanged;

  const factory PreparePayrollEvent.reportRequested() =
      PreparePayrollReportRequested;
}
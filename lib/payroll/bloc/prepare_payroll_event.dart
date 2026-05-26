part of 'prepare_payroll_bloc.dart';


@freezed
sealed class PreparePayrollEvent with _$PreparePayrollEvent {
  const factory PreparePayrollEvent.started() = PreparePayrollStarted;

  const factory PreparePayrollEvent.timeTrackingFileSelected(
    PlatformFile file,
  ) = PreparePayrollTimeTrackingFileSelected;

  const factory PreparePayrollEvent.nttFileSelected(
    PlatformFile file,
  ) = PreparePayrollNttFileSelected;

  const factory PreparePayrollEvent.scheduleFileSelected(
    PlatformFile file,
  ) = PreparePayrollScheduleFileSelected;

  const factory PreparePayrollEvent.mileageConstantChanged(double? value) =
      PreparePayrollMileageConstantChanged;

  const factory PreparePayrollEvent.reportRequested() =
      PreparePayrollReportRequested;
}
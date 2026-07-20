part of 'prepare_payroll_bloc.dart';


@freezed
sealed class PreparePayrollEvent with _$PreparePayrollEvent {
  const factory PreparePayrollEvent.started() = _PreparePayrollStarted;

  const factory PreparePayrollEvent.payRateFileSelected(
    PlatformFile file,
  ) = _PreparePayrollPayRateFileSelected;

  const factory PreparePayrollEvent.mileageConstantChanged(double? value) =
      _PreparePayrollMileageConstantChanged;

  const factory PreparePayrollEvent.heathDeductionsChanged(double? value) =
      _PreparePayrollHeathDeductionsChanged;

  const factory PreparePayrollEvent.cleaningRevenueChanged(double? value) =
      _PreparePayrollCleaningRevenueChanged;

  const factory PreparePayrollEvent.startDateChanged(DateTime? date) =
      _PreparePayrollStartDateChanged;

  const factory PreparePayrollEvent.endDateChanged(DateTime? date) =
      _PreparePayrollEndDateChanged;

  const factory PreparePayrollEvent.staffDayTimesRequested() =
      _PreparePayrollStaffDayTimesRequested;
}

part of 'prepare_payroll_bloc.dart';


@freezed
sealed class PreparePayrollEvent with _$PreparePayrollEvent {
  const factory PreparePayrollEvent.started() = _PreparePayrollStarted;

  /// Replaces the whole bonus-eligibility map (the editor saves every worker
  /// at once), keyed by Operto `StaffID`.
  const factory PreparePayrollEvent.bonusEligibilityChanged(
    Map<int, bool> qualifiesForBonusById,
  ) = _PreparePayrollBonusEligibilityChanged;

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

part of 'prepare_payroll_bloc.dart';

@freezed
abstract class PreparePayrollState with _$PreparePayrollState {
  const PreparePayrollState._();

  const factory PreparePayrollState({
    @Default(AsyncOperation.idle()) AsyncOperation<List<WorkerRow>> workerRows,
    DateTime? payPeriodStart,
    DateTime? payPeriodEnd,
    @Default(0.725) double? mileageConstant,
    double? heathDeductions,
    double? cleaningRevenue,
    DateTime? startDate,
    DateTime? endDate,
    @Default(AsyncOperation.idle())
    AsyncOperation<List<StaffDayTime>> staffDayTimes,
    @Default(<StaffTaskTime>[]) List<StaffTaskTime> staffTaskTimes,
    @Default(<StaffTask>[]) List<StaffTask> staffTasks,
    @Default(<int, String>{}) Map<int, String> staffNamesById,
    /// Workers (by Operto `StaffID`) whose cleans earn a share of the bonus
    /// pot. Operto exposes no such field, so it's entered in-app and persisted
    /// across runs; a worker absent from the map does not qualify.
    @Default(<int, bool>{}) Map<int, bool> qualifiesForBonusById,
  }) = _PreparePayrollState;

  /// Fraction of cleaning revenue that funds the bonus pot (5.75%).
  static const double bonusRevenueRate = 0.0575;

  /// Bonus pot shared across all workers:
  ///   5.75% of cleaning revenue, less heath deductions.
  double get bonusPot =>
      bonusRevenueRate * (cleaningRevenue ?? 0) - (heathDeductions ?? 0);

  /// Total "Check Out Clean" cleans across all workers — the denominator for
  /// each worker's pot share. Every clean performed dilutes the pot, including
  /// over-time cleans and the cleans of workers who don't qualify for the bonus
  /// ([WorkerRow.qualifiesForBonus] false); those workers simply forfeit their
  /// share (their [WorkerRow.bonusPay] is 0) rather than being removed from the
  /// total.
  int get totalCleans =>
      workerRows.data
          ?.fold<int>(0, (sum, r) => sum + r.cleans + r.overTimeCleans) ??
      0;

  /// True once Operto shifts have been fetched — bonus eligibility can only be
  /// edited for workers found in that data.
  bool get hasFetchedStaffDayTimes => staffDayTimes.isSuccess;

  /// Staff IDs with at least one worked shift (clock in *and* out) in the
  /// fetched Operto data — i.e. the workers who appear in payroll this period.
  Set<int> get staffIdsWithShifts => {
        for (final sdt in staffDayTimes.data ?? const <StaffDayTime>[])
          if (sdt.clockIn != null && sdt.clockOut != null) sdt.staffId,
      };

  bool get canFetchStaffDayTimes =>
      startDate != null && endDate != null && !staffDayTimes.isProcessing;
}
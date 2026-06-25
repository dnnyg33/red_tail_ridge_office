part of 'prepare_payroll_bloc.dart';

@freezed
abstract class PreparePayrollState with _$PreparePayrollState {
  const PreparePayrollState._();

  const factory PreparePayrollState({
    @Default(AsyncOperation.idle()) AsyncOperation<List<WorkerRow>> workerRows,
    DateTime? payPeriodStart,
    DateTime? payPeriodEnd,
    PlatformFile? payRateFile,
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
  }) = _PreparePayrollState;

  /// Bonus pot shared across all workers:
  ///   3.5% of cleaning revenue, less heath deductions.
  double get bonusPot =>
      0.035 * (cleaningRevenue ?? 0) - (heathDeductions ?? 0);

  /// Total "Check Out Clean" cleans across all workers — the denominator for
  /// each worker's pot share. Over-time cleans are included here (even though
  /// they're excluded from a worker's own qualifying [WorkerRow.cleans]) so the
  /// pot is still divided across every clean performed; the over-time worker
  /// simply forfeits credit for that clean. Workers who don't qualify for the
  /// bonus ([WorkerRow.qualifiesForBonus] false) are excluded entirely.
  int get totalCleans =>
      workerRows.data?.fold<int>(
          0,
          (sum, r) => r.qualifiesForBonus
              ? sum + r.cleans + r.overTimeCleans
              : sum) ??
      0;

  /// True once Operto shifts have been fetched — the pay-rate file can only be
  /// generated for workers found in that data.
  bool get hasFetchedStaffDayTimes => staffDayTimes.isSuccess;

  /// Staff IDs with at least one worked shift (clock in *and* out) in the
  /// fetched Operto data — i.e. the workers who appear in payroll this period.
  Set<int> get staffIdsWithShifts => {
        for (final sdt in staffDayTimes.data ?? const <StaffDayTime>[])
          if (sdt.clockIn != null && sdt.clockOut != null) sdt.staffId,
      };

  bool get canGenerateReport =>
      staffDayTimes.isSuccess && !workerRows.isProcessing;

  bool get canFetchStaffDayTimes =>
      startDate != null && endDate != null && !staffDayTimes.isProcessing;
}
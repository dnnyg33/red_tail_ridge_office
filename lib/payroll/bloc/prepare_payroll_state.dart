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

  /// Total "Check Out Clean" cleans across all workers in the report.
  int get totalCleans =>
      workerRows.data?.fold<int>(0, (sum, r) => sum + r.cleans) ?? 0;

  bool get canGenerateReport =>
      staffDayTimes.isSuccess && !workerRows.isProcessing;

  bool get canFetchStaffDayTimes =>
      startDate != null && endDate != null && !staffDayTimes.isProcessing;
}
import 'package:freezed_annotation/freezed_annotation.dart';

import 'worker_ntt.dart';

part 'worker_row.freezed.dart';

@freezed
abstract class WorkerRow with _$WorkerRow {
  const WorkerRow._();

  const factory WorkerRow({
    required String worker,
    required double periodHours,
    required String periodBreaks,
    @Default(0) double periodNtt,
    required double mileageForPeriod,
    required double payRate,
    /// Pay for the clocked-in hours: [payRate] × [periodHours]. Non-task time
    /// is *not* deducted here — see [nttCost].
    required double periodHourlyPay,
    required double mileagePay,
    @Default(<ProposedNttRow>[]) List<ProposedNttRow> nttRows,
    @Default(0) int cleans,
    /// "Check out clean" tasks excluded from the bonus because their tracked
    /// time exceeded the unit's `maxCleanTime`. Not included in [cleans].
    @Default(0) int overTimeCleans,
    /// Whether this worker's cleans earn a share of the bonus pot. Defaults to
    /// false; when false they earn no bonus, though their cleans still dilute
    /// the pot for everyone else.
    @Default(false) bool qualifiesForBonus,
    DateTime? periodStart,
    DateTime? periodEnd,
  }) = _WorkerRow;

  /// Clocked-in hours less non-task time — the hours actually spent on tasks.
  /// Informational only: every clocked-in hour is paid (see [periodHourlyPay]).
  double get netHours => periodHours - periodNtt;

  /// Hourly pay plus mileage pay — the worker's pay for the period, before any
  /// bonus.
  double get totalPeriodPay => periodHourlyPay + mileagePay;

  /// Dollar cost of this worker's non-task time: [periodNtt] hours at their own
  /// [payRate]. Clocked-in time is paid in full, so this idle-time cost comes
  /// off the bonus instead of the paycheck.
  double get nttCost => periodNtt * payRate;

  /// This worker's share of the bonus [pot], proportional to their cleans, less
  /// their non-task time and callback deductions:
  ///   pot × (cleans / totalCleans) − [nttCost] − callbacks (0 for now).
  ///
  /// Floored at 0: non-task time can wipe out the bonus but never turns into a
  /// debt against the paycheck. Workers who don't qualify — and everyone, when
  /// there are no cleans to divide the pot among — earn 0 regardless of NTT.
  double bonusPay({required double pot, required int totalCleans}) {
    if (!qualifiesForBonus || totalCleans <= 0) return 0;
    const callbackDeductions = 0;
    final net = pot * (cleans / totalCleans) - nttCost - callbackDeductions;
    return net < 0 ? 0 : net;
  }
}

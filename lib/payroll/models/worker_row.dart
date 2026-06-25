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
    required double periodHourlyPay,
    required double mileagePay,
    @Default(<ProposedNttRow>[]) List<ProposedNttRow> nttRows,
    @Default(0) int cleans,
    /// "Check out clean" tasks excluded from the bonus because their tracked
    /// time exceeded the unit's `maxCleanTime`. Not included in [cleans].
    @Default(0) int overTimeCleans,
    /// Whether this worker's cleans count toward the bonus pot (from the
    /// pay-rate file). Defaults to false; when false they earn no bonus and
    /// their cleans are excluded from the pot's total.
    @Default(false) bool qualifiesForBonus,
    DateTime? periodStart,
    DateTime? periodEnd,
  }) = _WorkerRow;

  /// Clocked-in hours less non-task time (NTT).
  double get netHours => periodHours - periodNtt;

  double get totalPeriodPay => periodHourlyPay + mileagePay;

  /// This worker's share of the bonus [pot], proportional to their cleans:
  ///   pot × (cleans / totalCleans) − callback deductions (0 for now).
  /// Returns 0 when the worker doesn't qualify for the bonus or there are no
  /// cleans to divide the pot among.
  double bonusPay({required double pot, required int totalCleans}) {
    if (!qualifiesForBonus || totalCleans <= 0) return 0;
    const callbackDeductions = 0;
    return pot * (cleans / totalCleans) - callbackDeductions;
  }
}

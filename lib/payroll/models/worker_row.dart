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
    DateTime? periodStart,
    DateTime? periodEnd,
  }) = _WorkerRow;

  /// Clocked-in hours less non-task time (NTT).
  double get netHours => periodHours - periodNtt;

  double get totalPeriodPay => periodHourlyPay + mileagePay;

  /// This worker's share of the bonus [pot], proportional to their cleans:
  ///   pot × (cleans / totalCleans) − callback deductions (0 for now).
  /// Returns 0 when there are no cleans to divide the pot among.
  double bonusPay({required double pot, required int totalCleans}) {
    if (totalCleans <= 0) return 0;
    const callbackDeductions = 0;
    return pot * (cleans / totalCleans) - callbackDeductions;
  }
}

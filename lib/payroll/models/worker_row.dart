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
    required double mileageForPeriod,
    required double payRate,
    required double periodHourlyPay,
    required double mileagePay,
    @Default(<ProposedNttRow>[]) List<ProposedNttRow> nttRows,
    DateTime? periodStart,
    DateTime? periodEnd,
  }) = _WorkerRow;

  double get totalPeriodPay => periodHourlyPay + mileagePay;
}

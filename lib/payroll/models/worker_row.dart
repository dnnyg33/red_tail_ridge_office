import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_row.freezed.dart';

@freezed
abstract class WorkerRow with _$WorkerRow {
  const WorkerRow._();

  const factory WorkerRow({
    required String worker,
    required double periodHours,
    @Default(0.0) double periodBreaks,
    required double mileageForPeriod,
    required double payRate,
    required double periodHourlyPay,
    required double mileagePay,
    DateTime? periodStart,
    DateTime? periodEnd,
  }) = _WorkerRow;

  double get totalPeriodPay => periodHourlyPay + mileagePay;
}

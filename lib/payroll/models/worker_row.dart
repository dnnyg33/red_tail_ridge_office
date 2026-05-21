import 'package:equatable/equatable.dart';

class WorkerRow extends Equatable {
  const WorkerRow({
    required this.worker,
    required this.periodHours,
    this.periodBreaks = 0.0,
    required this.mileageForPeriod,
    required this.payRate,
    required this.periodHourlyPay,
    required this.mileagePay,
    this.periodStart,
    this.periodEnd,
  });

  final String worker;
  final double periodHours;
  final double periodBreaks;
  final double mileageForPeriod;
  final double payRate;
  final double periodHourlyPay;
  final double mileagePay;
  final DateTime? periodStart;
  final DateTime? periodEnd;

  double get totalPeriodPay => periodHourlyPay + mileagePay;

  WorkerRow copyWith({
    String? worker,
    double? periodHours,
    double? periodBreaks,
    double? mileageForPeriod,
    double? payRate,
    double? periodHourlyPay,
    double? mileagePay,
    DateTime? periodStart,
    DateTime? periodEnd,
  }) {
    return WorkerRow(
      worker: worker ?? this.worker,
      periodHours: periodHours ?? this.periodHours,
      periodBreaks: periodBreaks ?? this.periodBreaks,
      mileageForPeriod: mileageForPeriod ?? this.mileageForPeriod,
      payRate: payRate ?? this.payRate,
      periodHourlyPay: periodHourlyPay ?? this.periodHourlyPay,
      mileagePay: mileagePay ?? this.mileagePay,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
    );
  }

  @override
  List<Object?> get props => [
        worker,
        periodHours,
        periodBreaks,
        mileageForPeriod,
        payRate,
        periodHourlyPay,
        mileagePay,
        periodStart,
        periodEnd,
      ];
}
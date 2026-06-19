import 'package:freezed_annotation/freezed_annotation.dart';

part 'pay_rate.freezed.dart';

/// A single worker's hourly pay rate, loaded from the uploaded pay-rate JSON
/// file. Operto doesn't expose pay rates, so they're supplied out-of-band as a
/// JSON array of `{ "name", "payRate", "workerId" }` objects. [workerId]
/// matches the Operto `StaffID` the rest of payroll is keyed by; [name] is for
/// human reference only.
@freezed
abstract class PayRate with _$PayRate {
  const PayRate._();

  const factory PayRate({
    required String name,
    required double payRate,
    required int workerId,
  }) = _PayRate;

  static PayRate fromJson(Map<String, dynamic> json) => PayRate(
        name: (json['name'] as String?)?.trim() ?? '',
        payRate: (json['payRate'] as num?)?.toDouble() ?? 0,
        workerId: (json['workerId'] as num?)?.toInt() ?? 0,
      );
}

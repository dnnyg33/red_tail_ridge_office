import 'package:freezed_annotation/freezed_annotation.dart';

import 'operto_timestamps.dart';

part 'staff_day_time.freezed.dart';

/// A single Operto Teams "Staff Day Time" record: one staff member's clock
/// in/out (and mileage odometer) for a shift, from `GET /api/v1/staffdaytimes`.
///
/// Note the API identifies the worker only by [staffId] — resolving a name
/// requires the Staff endpoint — and carries no pay-rate data.
@freezed
abstract class StaffDayTime with _$StaffDayTime {
  const StaffDayTime._();

  const factory StaffDayTime({
    required int id,
    required int staffId,
    DateTime? clockIn,
    DateTime? clockOut,
    num? mileageIn,
    num? mileageOut,
    @Default(false) bool autoLogOut,
  }) = _StaffDayTime;

  /// Time clocked in for this shift, when both ends are present.
  Duration? get worked => clockIn != null && clockOut != null
      ? clockOut!.difference(clockIn!)
      : null;

  /// Miles driven for this shift, when both odometer readings are present.
  num? get mileage => mileageIn != null && mileageOut != null
      ? mileageOut! - mileageIn!
      : null;

  static StaffDayTime fromJson(Map<String, dynamic> json) => StaffDayTime(
        id: opertoInt(json['StaffDayTimeID']) ?? 0,
        staffId: opertoInt(json['StaffID']) ?? 0,
        clockIn: parseOpertoTimestamp(json['ClockIn']),
        clockOut: parseOpertoTimestamp(json['ClockOut']),
        mileageIn: opertoDouble(json['MileageIn']),
        mileageOut: opertoDouble(json['MileageOut']),
        autoLogOut: json['AutoLogOutFlag'] == true,
      );
}

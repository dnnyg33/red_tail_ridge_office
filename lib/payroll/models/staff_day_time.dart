import 'package:equatable/equatable.dart';

import 'operto_timestamps.dart';

/// A single Operto Teams "Staff Day Time" record: one staff member's clock
/// in/out (and mileage odometer) for a shift, from `GET /api/v1/staffdaytimes`.
///
/// Note the API identifies the worker only by [staffId] — resolving a name
/// requires the Staff endpoint — and carries no pay-rate data.
class StaffDayTime extends Equatable {
  const StaffDayTime({
    required this.id,
    required this.staffId,
    this.clockIn,
    this.clockOut,
    this.mileageIn,
    this.mileageOut,
    this.autoLogOut = false,
  });

  final int id;
  final int staffId;
  final DateTime? clockIn;
  final DateTime? clockOut;
  final num? mileageIn;
  final num? mileageOut;
  final bool autoLogOut;

  /// Time clocked in for this shift, when both ends are present.
  Duration? get worked => clockIn != null && clockOut != null
      ? clockOut!.difference(clockIn!)
      : null;

  /// Miles driven for this shift, when both odometer readings are present.
  num? get mileage => mileageIn != null && mileageOut != null
      ? mileageOut! - mileageIn!
      : null;

  factory StaffDayTime.fromJson(Map<String, dynamic> json) {
    return StaffDayTime(
      id: opertoInt(json['StaffDayTimeID']) ?? 0,
      staffId: opertoInt(json['StaffID']) ?? 0,
      clockIn: parseOpertoTimestamp(json['ClockIn']),
      clockOut: parseOpertoTimestamp(json['ClockOut']),
      mileageIn: opertoDouble(json['MileageIn']),
      mileageOut: opertoDouble(json['MileageOut']),
      autoLogOut: json['AutoLogOutFlag'] == true,
    );
  }

  @override
  List<Object?> get props =>
      [id, staffId, clockIn, clockOut, mileageIn, mileageOut, autoLogOut];
}

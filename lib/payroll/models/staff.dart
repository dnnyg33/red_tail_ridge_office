import 'package:freezed_annotation/freezed_annotation.dart';

import 'operto_timestamps.dart';

part 'staff.freezed.dart';

/// An Operto Teams staff member, from `GET /api/v1/staff`. Used to resolve the
/// [StaffDayTime]'s numeric `StaffID` into the worker name the payroll report
/// and the task/schedule CSVs are keyed by.
@freezed
abstract class Staff with _$Staff {
  const Staff._();

  const factory Staff({
    required int id,
    required String name,
    @Default(true) bool active,
  }) = _Staff;

  static Staff fromJson(Map<String, dynamic> json) => Staff(
        id: opertoInt(json['StaffID']) ?? 0,
        name: (json['Name'] as String?)?.trim() ?? '',
        active: json['Active'] == true,
      );
}

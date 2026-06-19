import 'package:equatable/equatable.dart';

import 'operto_timestamps.dart';

/// An Operto Teams staff member, from `GET /api/v1/staff`. Used to resolve the
/// [StaffDayTime]'s numeric `StaffID` into the worker name the payroll report
/// and the task/schedule CSVs are keyed by.
class Staff extends Equatable {
  const Staff({
    required this.id,
    required this.name,
    this.active = true,
  });

  final int id;
  final String name;
  final bool active;

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: opertoInt(json['StaffID']) ?? 0,
      name: (json['Name'] as String?)?.trim() ?? '',
      active: json['Active'] == true,
    );
  }

  @override
  List<Object?> get props => [id, name, active];
}

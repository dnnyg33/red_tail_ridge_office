import 'package:equatable/equatable.dart';

import 'operto_timestamps.dart';

/// An Operto Teams "Staff Task" (an assignment), from `GET /api/v1/stafftasks`.
/// This is the API equivalent of the old schedule CSV: it ties a staff member
/// to a task on a property for a date, and resolves a [StaffTaskTime]'s
/// `TaskID` to its property.
///
/// (Pay fields on this endpoint come back as 0, so pay is taken from an
/// uploaded CSV instead.)
class StaffTask extends Equatable {
  const StaffTask({
    required this.taskId,
    required this.staffId,
    required this.propertyId,
    this.taskName = '',
    this.taskDate,
  });

  final int taskId;
  final int staffId;
  final int propertyId;
  final String taskName;
  final DateTime? taskDate;

  factory StaffTask.fromJson(Map<String, dynamic> json) {
    return StaffTask(
      taskId: opertoInt(json['TaskID']) ?? 0,
      staffId: opertoInt(json['StaffID']) ?? 0,
      propertyId: opertoInt(json['PropertyID']) ?? 0,
      taskName: (json['TaskName'] as String?)?.trim() ?? '',
      taskDate: parseOpertoDate(json['TaskDate']),
    );
  }

  @override
  List<Object?> get props =>
      [taskId, staffId, propertyId, taskName, taskDate];
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'operto_timestamps.dart';

part 'staff_task.freezed.dart';

/// An Operto Teams "Staff Task" (an assignment), from `GET /api/v1/stafftasks`.
/// This is the API equivalent of the old schedule CSV: it ties a staff member
/// to a task on a property for a date, and resolves a [StaffTaskTime]'s
/// `TaskID` to its property.
///
/// (Pay fields on this endpoint come back as 0, so pay is taken from an
/// uploaded CSV instead.)
@freezed
abstract class StaffTask with _$StaffTask {
  const StaffTask._();

  const factory StaffTask({
    required int taskId,
    required int staffId,
    required int propertyId,
    @Default('') String taskName,
    DateTime? taskDate,
    /// Time spent on the task, parsed from the API's `HH:MM:SS` `TimeTracked`
    /// string. Null when not tracked. Compared against the unit's
    /// `maxCleanTime` to decide whether a checkout clean counts for the bonus.
    Duration? timeTracked,
  }) = _StaffTask;

  static StaffTask fromJson(Map<String, dynamic> json) => StaffTask(
        taskId: opertoInt(json['TaskID']) ?? 0,
        staffId: opertoInt(json['StaffID']) ?? 0,
        propertyId: opertoInt(json['PropertyID']) ?? 0,
        taskName: (json['TaskName'] as String?)?.trim() ?? '',
        taskDate: parseOpertoDate(json['TaskDate']),
        timeTracked: parseOpertoElapsed(json['TimeTracked']),
      );
}

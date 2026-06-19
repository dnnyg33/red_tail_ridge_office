import 'package:freezed_annotation/freezed_annotation.dart';

import 'operto_timestamps.dart';

part 'staff_task_time.freezed.dart';

/// A single Operto Teams "Staff Task Time" record: one staff member's clock
/// in/out against a specific task, from `GET /api/v1/stafftasktimes`.
///
/// Note the record carries only [taskId] — resolving the task's property name
/// requires a separate lookup (the Tasks endpoint).
@freezed
abstract class StaffTaskTime with _$StaffTaskTime {
  const StaffTaskTime._();

  const factory StaffTaskTime({
    required int id,
    required int staffId,
    required int taskId,
    DateTime? clockIn,
    DateTime? clockOut,
    String? note,
  }) = _StaffTaskTime;

  /// Time spent on this task, when both ends are present.
  Duration? get worked => clockIn != null && clockOut != null
      ? clockOut!.difference(clockIn!)
      : null;

  static StaffTaskTime fromJson(Map<String, dynamic> json) => StaffTaskTime(
        id: opertoInt(json['StaffTaskTimeID']) ?? 0,
        staffId: opertoInt(json['StaffID']) ?? 0,
        taskId: opertoInt(json['TaskID']) ?? 0,
        clockIn: parseOpertoTimestamp(json['ClockIn']),
        clockOut: parseOpertoTimestamp(json['ClockOut']),
        note: json['Note'] as String?,
      );
}

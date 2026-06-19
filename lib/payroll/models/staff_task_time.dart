import 'package:equatable/equatable.dart';

import 'operto_timestamps.dart';

/// A single Operto Teams "Staff Task Time" record: one staff member's clock
/// in/out against a specific task, from `GET /api/v1/stafftasktimes`.
///
/// Note the record carries only [taskId] — resolving the task's property name
/// requires a separate lookup (the Tasks endpoint).
class StaffTaskTime extends Equatable {
  const StaffTaskTime({
    required this.id,
    required this.staffId,
    required this.taskId,
    this.clockIn,
    this.clockOut,
    this.note,
  });

  final int id;
  final int staffId;
  final int taskId;
  final DateTime? clockIn;
  final DateTime? clockOut;
  final String? note;

  /// Time spent on this task, when both ends are present.
  Duration? get worked => clockIn != null && clockOut != null
      ? clockOut!.difference(clockIn!)
      : null;

  factory StaffTaskTime.fromJson(Map<String, dynamic> json) {
    return StaffTaskTime(
      id: opertoInt(json['StaffTaskTimeID']) ?? 0,
      staffId: opertoInt(json['StaffID']) ?? 0,
      taskId: opertoInt(json['TaskID']) ?? 0,
      clockIn: parseOpertoTimestamp(json['ClockIn']),
      clockOut: parseOpertoTimestamp(json['ClockOut']),
      note: json['Note'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, staffId, taskId, clockIn, clockOut, note];
}

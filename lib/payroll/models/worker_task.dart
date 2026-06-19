import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_task.freezed.dart';

/// A single task-time entry for one worker: when they worked a task and for
/// how long. Input to NTT calculations, sourced from either the task-time CSV
/// or Operto StaffTaskTimes.
///
/// [date] is `YYYY/MM/DD` and [start]/[end] are `HH:MM` (24h) so they line up
/// with [WorkerShift]. [property] may be empty when the source doesn't expose
/// a property name (e.g. the Operto API, which only gives a task id).
@freezed
abstract class WorkerTask with _$WorkerTask {
  const factory WorkerTask({
    required String date,
    required String start,
    required String end,
    required int minutes,
    required String property,
  }) = _WorkerTask;
}

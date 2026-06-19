/// A single task-time entry for one worker: when they worked a task and for
/// how long. Input to NTT calculations, sourced from either the task-time CSV
/// or Operto StaffTaskTimes.
///
/// [date] is `YYYY/MM/DD` and [start]/[end] are `HH:MM` (24h) so they line up
/// with [WorkerShift]. [property] may be empty when the source doesn't expose
/// a property name (e.g. the Operto API, which only gives a task id).
class WorkerTask {
  const WorkerTask({
    required this.date,
    required this.start,
    required this.end,
    required this.minutes,
    required this.property,
  });

  final String date;
  final String start;
  final String end;
  final int minutes;
  final String property;
}

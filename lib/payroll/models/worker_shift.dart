/// A single worked shift for one worker: total time plus clock in/out, used as
/// the input to NTT calculations. Sourced from either the time-tracking CSV or
/// Operto StaffDayTimes.
///
/// [date] is a `YYYY/MM/DD` string so it matches the task/schedule CSV dates;
/// [clockIn]/[clockOut] are `HH:MM` (24h) strings.
class WorkerShift {
  const WorkerShift({
    required this.date,
    required this.minutes,
    required this.clockIn,
    required this.clockOut,
  });

  final String date;
  final int minutes;
  final String clockIn;
  final String clockOut;
}

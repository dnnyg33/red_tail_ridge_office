import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_shift.freezed.dart';

/// A single worked shift for one worker: total time plus clock in/out, used as
/// the input to NTT calculations. Sourced from either the time-tracking CSV or
/// Operto StaffDayTimes.
///
/// [date] is a `YYYY/MM/DD` string so it matches the task/schedule CSV dates;
/// [clockIn]/[clockOut] are `HH:MM` (24h) strings.
@freezed
abstract class WorkerShift with _$WorkerShift {
  const factory WorkerShift({
    required String date,
    required int minutes,
    required String clockIn,
    required String clockOut,
  }) = _WorkerShift;
}

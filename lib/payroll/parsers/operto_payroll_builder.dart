import '../models/schedule_assignments.dart';
import '../models/staff_day_time.dart';
import '../models/staff_task.dart';
import '../models/staff_task_time.dart';
import '../models/worker_ntt.dart';
import '../models/worker_row.dart';
import '../models/worker_shift.dart';
import '../models/worker_task.dart';
import '../property_constants.dart';
import 'ntt_tracking_csv_parser.dart';

/// Builds the payroll [WorkerRow] list entirely from Operto data — no CSV or
/// JSON uploads at all.
///
/// Shifts + mileage come from [StaffDayTime]s, task time from [StaffTaskTime]s,
/// and the schedule (assignments, drive time, task-switching leeway, clean
/// counts, and the inadvertent-property check) from [StaffTask]s. A task's
/// `PropertyID` is resolved to a [Unit] name via [propertyById] so the
/// name-keyed drive-time table still applies. Pay rates come from the
/// [StaffTask]s' own `PayRate` (see [payRatesByStaffId]), defaulting to
/// [defaultPayRate] when Operto reports none.
class OpertoPayrollBuilder {
  const OpertoPayrollBuilder();

  /// Hourly rate used when none of a worker's tasks carry a rate.
  static const double defaultPayRate = 16;

  List<WorkerRow> build({
    required List<StaffDayTime> staffDayTimes,
    required List<StaffTaskTime> staffTaskTimes,
    required List<StaffTask> staffTasks,
    required Map<int, String> staffNamesById,
    required double mileageConstant,
    Map<int, bool> qualifiesForBonusById = const {},
  }) {
    final payRatesById = payRatesByStaffId(staffTasks);

    final propertyIdByTaskId = {
      for (final t in staffTasks)
        if (t.propertyId != 0) t.taskId: t.propertyId,
    };

    // Schedule (assignments) from StaffTasks. Date may be empty if TaskDate is
    // missing — clean counts still work (period total), only the per-day
    // drive-time / task-count / inadvertent lookups need a matching date.
    final assignments = ScheduleAssignments([
      for (final t in staffTasks)
        if (staffNamesById[t.staffId] case final name?)
          Assignment(
            worker: name,
            date: t.taskDate == null ? '' : _ymd(t.taskDate!),
            property: _propertyName(t.propertyId),
            task: t.taskName,
          ),
    ]);

    final aggregates = <int, _WorkerAggregate>{};
    final shiftsByWorker = <String, List<WorkerShift>>{};

    for (final sdt in staffDayTimes) {
      final clockIn = sdt.clockIn;
      final clockOut = sdt.clockOut;
      if (clockIn == null || clockOut == null) continue;

      final name = staffNamesById[sdt.staffId] ?? 'Staff ${sdt.staffId}';
      final minutes = clockOut.difference(clockIn).inMinutes;

      final agg = aggregates.putIfAbsent(
        sdt.staffId,
        () => _WorkerAggregate(
          name,
          payRatesById[sdt.staffId] ?? defaultPayRate,
        ),
      );
      agg.totalMinutes += minutes;
      agg.totalMileage += (sdt.mileage ?? 0).toDouble();
      agg.observe(clockIn);

      shiftsByWorker.putIfAbsent(name, () => <WorkerShift>[]).add(
            WorkerShift(
              date: _ymd(clockIn),
              minutes: minutes,
              clockIn: _hhmm(clockIn),
              clockOut: _hhmm(clockOut),
            ),
          );
    }

    final tasksByWorker = <String, List<WorkerTask>>{};
    for (final stt in staffTaskTimes) {
      final clockIn = stt.clockIn;
      final clockOut = stt.clockOut;
      if (clockIn == null || clockOut == null) continue;

      final name = staffNamesById[stt.staffId] ?? 'Staff ${stt.staffId}';
      tasksByWorker.putIfAbsent(name, () => <WorkerTask>[]).add(
            WorkerTask(
              date: _ymd(clockIn),
              start: _hhmm(clockIn),
              end: _hhmm(clockOut),
              minutes: clockOut.difference(clockIn).inMinutes,
              property: _propertyName(propertyIdByTaskId[stt.taskId]),
            ),
          );
    }

    final workerNtts = {
      for (final n in const NttTrackingCsvParser().computeFromShifts(
        shiftsByWorker: shiftsByWorker,
        tasksByWorker: tasksByWorker,
        assignments: assignments,
      ))
        n.workerName: n,
    };

    // "Check out clean" tallies per worker. A clean whose tracked time exceeds
    // its unit's maxCleanTime does not count toward the bonus and is reported
    // separately. Cleans with an unknown unit or no tracked time are counted.
    final cleanTallies = <String, _CleanTally>{};
    for (final t in staffTasks) {
      if (!t.taskName.toLowerCase().contains('check out clean')) continue;
      final name = staffNamesById[t.staffId];
      if (name == null) continue;

      final tally = cleanTallies.putIfAbsent(name, _CleanTally.new);
      final maxCleanTime = propertyById[t.propertyId]?.maxCleanTime;
      final tracked = t.timeTracked;
      if (maxCleanTime != null &&
          tracked != null &&
          tracked.inSeconds > maxCleanTime * 60) {
        tally.overTime++;
      } else {
        tally.counted++;
      }
    }

    final rows = <WorkerRow>[];
    for (final MapEntry(key: staffId, value: agg) in aggregates.entries) {
      final workerNtt = workerNtts[agg.name];
      final cleanTally = cleanTallies[agg.name];
      final periodNtt = workerNtt?.totalNtt ?? 0;
      final periodHours = agg.totalMinutes / 60.0;
      final grossPay = agg.payRate * periodHours;
      rows.add(WorkerRow(
        worker: agg.name,
        periodHours: periodHours,
        mileageForPeriod: agg.totalMileage,
        payRate: agg.payRate,
        periodHourlyPay: grossPay - periodNtt * agg.payRate,
        mileagePay: agg.totalMileage * mileageConstant,
        periodStart: agg.earliest,
        periodEnd: agg.latest,
        periodBreaks: periodNtt.toStringAsFixed(2),
        periodNtt: periodNtt,
        nttRows: workerNtt?.nttRows ?? const <ProposedNttRow>[],
        cleans: cleanTally?.counted ?? 0,
        overTimeCleans: cleanTally?.overTime ?? 0,
        qualifiesForBonus: qualifiesForBonusById[staffId] ?? false,
      ));
    }
    return rows;
  }

  /// Each worker's hourly rate, taken from the `PayRate` on their latest
  /// [StaffTask] that carries a non-zero one.
  ///
  /// Operto reports the rate per task, but payroll pays one hourly rate for the
  /// period, so the most recent rate wins — a mid-period raise applies to the
  /// whole period. Zero rates are ignored rather than treated as a $0 raise:
  /// Operto leaves `PayRate` at 0 on records it has no rate for. Tasks with no
  /// `TaskDate` rank below every dated task, so they only supply a rate when
  /// nothing dated does. Workers with no non-zero rate are absent from the map
  /// and fall back to [defaultPayRate].
  static Map<int, double> payRatesByStaffId(List<StaffTask> staffTasks) {
    final latest = <int, DateTime?>{};
    final rates = <int, double>{};
    for (final t in staffTasks) {
      if (t.payRate <= 0) continue;
      if (rates.containsKey(t.staffId)) {
        final seen = latest[t.staffId];
        // A dated task beats an undated one; between two dated tasks the later
        // wins. An undated task never displaces an already-recorded rate.
        if (t.taskDate == null) continue;
        if (seen != null && !t.taskDate!.isAfter(seen)) continue;
      }
      latest[t.staffId] = t.taskDate;
      rates[t.staffId] = t.payRate;
    }
    return rates;
  }

  /// Resolves a `PropertyID` to its mapped [Unit] name, or a stable
  /// `Property <id>` placeholder for ids not in [propertyById]. Returns '' for
  /// a missing id so NTT attribution skips it.
  static String _propertyName(int? id) {
    if (id == null || id == 0) return '';
    return propertyById[id]?.name ?? 'Property $id';
  }

  /// `YYYY/MM/DD`, matching the NTT date keys.
  static String _ymd(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}/'
      '${d.month.toString().padLeft(2, '0')}/'
      '${d.day.toString().padLeft(2, '0')}';

  /// `HH:MM` 24-hour.
  static String _hhmm(DateTime d) =>
      '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
}

/// Per-worker checkout-clean counts: [counted] go toward the bonus, [overTime]
/// are excluded for exceeding the unit's maxCleanTime.
class _CleanTally {
  int counted = 0;
  int overTime = 0;
}

class _WorkerAggregate {
  _WorkerAggregate(this.name, this.payRate);

  final String name;
  final double payRate;
  int totalMinutes = 0;
  double totalMileage = 0;
  DateTime? earliest;
  DateTime? latest;

  void observe(DateTime date) {
    if (earliest == null || date.isBefore(earliest!)) earliest = date;
    if (latest == null || date.isAfter(latest!)) latest = date;
  }
}

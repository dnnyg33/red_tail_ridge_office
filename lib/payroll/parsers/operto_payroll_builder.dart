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

/// Builds the payroll [WorkerRow] list entirely from Operto data — no CSV
/// uploads except the optional pay-rate file.
///
/// Shifts + mileage come from [StaffDayTime]s, task time from [StaffTaskTime]s,
/// and the schedule (assignments, drive time, task-switching leeway, clean
/// counts, and the inadvertent-property check) from [StaffTask]s. A task's
/// `PropertyID` is resolved to a [Unit] name via [propertyById] so the
/// name-keyed drive-time table still applies. Pay rate comes from a
/// user-supplied per-staff map, defaulting to [defaultPayRate] when absent.
class OpertoPayrollBuilder {
  const OpertoPayrollBuilder();

  /// Hourly rate used when a worker has no entry in the pay-rate file.
  static const double defaultPayRate = 16;

  List<WorkerRow> build({
    required List<StaffDayTime> staffDayTimes,
    required List<StaffTaskTime> staffTaskTimes,
    required List<StaffTask> staffTasks,
    required Map<int, String> staffNamesById,
    required Map<int, double> payRatesById,
    required double mileageConstant,
    Map<int, bool> qualifiesForBonusById = const {},
  }) {
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

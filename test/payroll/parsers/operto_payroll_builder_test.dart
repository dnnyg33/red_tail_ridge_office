import 'package:flutter_test/flutter_test.dart';
import 'package:red_tail_ridge_office/payroll/models/staff_day_time.dart';
import 'package:red_tail_ridge_office/payroll/models/staff_task.dart';
import 'package:red_tail_ridge_office/payroll/models/staff_task_time.dart';
import 'package:red_tail_ridge_office/payroll/parsers/operto_payroll_builder.dart';

void main() {
  // A_118Basement: propertyId 126992, maxCleanTime 75 minutes.
  const cappedProperty = 126992;
  const unknownProperty = 999999;

  StaffTask clean({
    required int propertyId,
    String? timeTracked,
    String name = 'Check Out Clean',
    double payRate = 0,
    DateTime? taskDate,
  }) =>
      StaffTask(
        taskId: 0,
        staffId: 1,
        propertyId: propertyId,
        taskName: name,
        payRate: payRate,
        taskDate: taskDate,
        timeTracked:
            timeTracked == null ? null : _hms(timeTracked),
      );

  List<dynamic> build(
    List<StaffTask> staffTasks, {
    Map<int, bool> qualifiesForBonusById = const {},
  }) {
    return const OpertoPayrollBuilder().build(
      staffDayTimes: [
        StaffDayTime(
          id: 1,
          staffId: 1,
          clockIn: DateTime(2026, 6, 1, 9),
          clockOut: DateTime(2026, 6, 1, 17),
        ),
      ],
      staffTaskTimes: const <StaffTaskTime>[],
      staffTasks: staffTasks,
      staffNamesById: const {1: 'Alice'},
      qualifiesForBonusById: qualifiesForBonusById,
      mileageConstant: 0.5,
    );
  }

  group('OpertoPayrollBuilder checkout-clean counting', () {
    test('excludes cleans over the unit maxCleanTime and tallies them', () {
      final rows = build([
        clean(propertyId: cappedProperty, timeTracked: '01:23:33'), // 83m > 75
        clean(propertyId: cappedProperty, timeTracked: '00:50:00'), // 50m ok
        clean(propertyId: cappedProperty, timeTracked: null), // untracked -> ok
        clean(propertyId: cappedProperty, name: 'Mid Stay Clean'), // not checkout
      ]);

      final row = rows.single;
      expect(row.cleans, 2);
      expect(row.overTimeCleans, 1);
    });

    test('a clean exactly at the cap still counts (strictly greater excludes)',
        () {
      final rows = build([
        clean(propertyId: cappedProperty, timeTracked: '01:15:00'), // 75m == cap
      ]);

      final row = rows.single;
      expect(row.cleans, 1);
      expect(row.overTimeCleans, 0);
    });

    test('cleans at an unknown unit always count (no cap to enforce)', () {
      final rows = build([
        clean(propertyId: unknownProperty, timeTracked: '05:00:00'),
      ]);

      final row = rows.single;
      expect(row.cleans, 1);
      expect(row.overTimeCleans, 0);
    });

    test('qualifiesForBonus comes from the map and defaults to false', () {
      final notInMap = build([clean(propertyId: cappedProperty)]).single;
      expect(notInMap.qualifiesForBonus, isFalse);

      final optedIn = build(
        [clean(propertyId: cappedProperty)],
        qualifiesForBonusById: const {1: true},
      ).single;
      expect(optedIn.qualifiesForBonus, isTrue);
    });
  });

  group('OpertoPayrollBuilder pay rates', () {
    test('takes the rate from the latest task carrying one', () {
      final row = build([
        clean(
          propertyId: cappedProperty,
          payRate: 22.50,
          taskDate: DateTime(2026, 6, 14),
        ),
        clean(
          propertyId: cappedProperty,
          payRate: 23,
          taskDate: DateTime(2026, 6, 28),
        ),
        clean(
          propertyId: cappedProperty,
          payRate: 21,
          taskDate: DateTime(2026, 6, 2),
        ),
      ]).single;

      expect(row.payRate, 23);
    });

    test('ignores zero rates rather than treating them as a cut', () {
      final row = build([
        clean(
          propertyId: cappedProperty,
          payRate: 22.50,
          taskDate: DateTime(2026, 6, 14),
        ),
        clean(
          propertyId: cappedProperty,
          taskDate: DateTime(2026, 6, 28),
        ),
      ]).single;

      expect(row.payRate, 22.50);
    });

    test('falls back to the default rate when no task carries one', () {
      final row = build([clean(propertyId: cappedProperty)]).single;
      expect(row.payRate, OpertoPayrollBuilder.defaultPayRate);
    });

    test('an undated task only supplies the rate when nothing dated does', () {
      final undatedOnly =
          build([clean(propertyId: cappedProperty, payRate: 19)]).single;
      expect(undatedOnly.payRate, 19);

      final datedWins = build([
        clean(propertyId: cappedProperty, payRate: 19),
        clean(
          propertyId: cappedProperty,
          payRate: 21,
          taskDate: DateTime(2026, 6, 2),
        ),
      ]).single;
      expect(datedWins.payRate, 21);
    });

    test('rates are per worker', () {
      final rates = OpertoPayrollBuilder.payRatesByStaffId([
        const StaffTask(taskId: 1, staffId: 1, propertyId: 0, payRate: 20),
        const StaffTask(taskId: 2, staffId: 2, propertyId: 0, payRate: 25),
        const StaffTask(taskId: 3, staffId: 3, propertyId: 0),
      ]);

      expect(rates, {1: 20.0, 2: 25.0});
    });
  });
}

Duration _hms(String s) {
  final p = s.split(':').map(int.parse).toList();
  return Duration(hours: p[0], minutes: p[1], seconds: p[2]);
}

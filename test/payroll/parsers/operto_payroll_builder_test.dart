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
  }) =>
      StaffTask(
        taskId: 0,
        staffId: 1,
        propertyId: propertyId,
        taskName: name,
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
      payRatesById: const {},
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
}

Duration _hms(String s) {
  final p = s.split(':').map(int.parse).toList();
  return Duration(hours: p[0], minutes: p[1], seconds: p[2]);
}

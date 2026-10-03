import 'package:flutter_test/flutter_test.dart';
import 'package:red_tail_ridge_office/payroll/models/worker_row.dart';

/// A worker with 8 clocked hours at $20/hr and $10 of mileage pay.
WorkerRow _row({
  double periodNtt = 0,
  int cleans = 0,
  bool qualifiesForBonus = true,
}) =>
    WorkerRow(
      worker: 'Alice',
      periodHours: 8,
      periodBreaks: '0',
      periodNtt: periodNtt,
      mileageForPeriod: 20,
      payRate: 20,
      periodHourlyPay: 160,
      mileagePay: 10,
      cleans: cleans,
      qualifiesForBonus: qualifiesForBonus,
    );

void main() {
  group('pay', () {
    test('is hourly pay plus mileage pay, with no NTT deduction', () {
      expect(_row(periodNtt: 2).totalPeriodPay, 170);
    });

    test('netHours reports on-task time without affecting pay', () {
      final row = _row(periodNtt: 2);
      expect(row.netHours, 6);
      expect(row.periodHourlyPay, 160);
    });
  });

  group('nttCost', () {
    test('prices non-task time at the worker\'s own rate', () {
      expect(_row(periodNtt: 2.5).nttCost, 50);
      expect(_row().nttCost, 0);
    });
  });

  group('bonusPay', () {
    test('is the pot share less the NTT cost', () {
      final row = _row(periodNtt: 2, cleans: 5);
      // 1/2 of a $400 pot = $200, less 2 hrs × $20 = $40.
      expect(row.bonusPay(pot: 400, totalCleans: 10), 160);
    });

    test('is the full share when there is no non-task time', () {
      expect(_row(cleans: 5).bonusPay(pot: 400, totalCleans: 10), 200);
    });

    test('floors at 0 when non-task time exceeds the share', () {
      final row = _row(periodNtt: 12, cleans: 1);
      // 1/10 of $400 = $40, less 12 hrs × $20 = $240.
      expect(row.bonusPay(pot: 400, totalCleans: 10), 0);
    });

    test('is 0 for an ineligible worker, NTT or not', () {
      final row = _row(periodNtt: 2, cleans: 5, qualifiesForBonus: false);
      expect(row.bonusPay(pot: 400, totalCleans: 10), 0);
    });

    test('is 0 when there are no cleans to divide the pot among', () {
      expect(_row(periodNtt: 2).bonusPay(pot: 400, totalCleans: 0), 0);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:red_tail_ridge_office/payroll/date_range_presets.dart';

void main() {
  group('lastCalendarMonth', () {
    test('is the previous month, 1st to last day', () {
      expect(
        lastCalendarMonth(DateTime(2026, 10, 3)),
        (DateTime(2026, 9, 1), DateTime(2026, 9, 30)),
      );
    });

    test('crosses the year boundary', () {
      expect(
        lastCalendarMonth(DateTime(2026, 1, 20)),
        (DateTime(2025, 12, 1), DateTime(2025, 12, 31)),
      );
    });

    test('handles a short previous month', () {
      expect(
        lastCalendarMonth(DateTime(2026, 3, 10)),
        (DateTime(2026, 2, 1), DateTime(2026, 2, 28)),
      );
    });
  });

  group('lastSemiMonthlyPeriod', () {
    test('before the 15th falls back to the previous second half', () {
      expect(
        lastSemiMonthlyPeriod(DateTime(2026, 10, 3)),
        (DateTime(2026, 9, 16), DateTime(2026, 9, 30)),
      );
    });

    test('on the 1st falls back to the previous second half', () {
      expect(
        lastSemiMonthlyPeriod(DateTime(2026, 1, 1)),
        (DateTime(2025, 12, 16), DateTime(2025, 12, 31)),
      );
    });

    test('on the 15th the first half has just finished', () {
      expect(
        lastSemiMonthlyPeriod(DateTime(2026, 10, 15)),
        (DateTime(2026, 10, 1), DateTime(2026, 10, 15)),
      );
    });

    test('mid-second-half still reports the finished first half', () {
      expect(
        lastSemiMonthlyPeriod(DateTime(2026, 10, 20)),
        (DateTime(2026, 10, 1), DateTime(2026, 10, 15)),
      );
    });

    test('on the last day of the month the second half has finished', () {
      expect(
        lastSemiMonthlyPeriod(DateTime(2026, 10, 31)),
        (DateTime(2026, 10, 16), DateTime(2026, 10, 31)),
      );
    });

    test('the last day of a short month counts as finished', () {
      expect(
        lastSemiMonthlyPeriod(DateTime(2026, 2, 28)),
        (DateTime(2026, 2, 16), DateTime(2026, 2, 28)),
      );
      expect(
        lastSemiMonthlyPeriod(DateTime(2024, 2, 29)),
        (DateTime(2024, 2, 16), DateTime(2024, 2, 29)),
      );
    });
  });
}

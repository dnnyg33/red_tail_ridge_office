import 'package:flutter_test/flutter_test.dart';
import 'package:red_tail_ridge_office/payroll/models/operto_timestamps.dart';

void main() {
  group('parseOpertoTimestamp (GMT -> Pacific)', () {
    test('14-digit GMT timestamp converts to PDT (UTC-7) in summer', () {
      // 2026-06-19 04:00 GMT -> 2026-06-18 21:00 PDT.
      final result = parseOpertoTimestamp('20260619040000');
      expect(result, DateTime(2026, 6, 18, 21, 0, 0));
    });

    test('14-digit GMT timestamp converts to PST (UTC-8) in winter', () {
      // 2026-01-15 04:00 GMT -> 2026-01-14 20:00 PST.
      final result = parseOpertoTimestamp('20260115040000');
      expect(result, DateTime(2026, 1, 14, 20, 0, 0));
    });

    test('an evening GMT instant does not spill onto the next local day', () {
      // 2026-06-20 02:30 GMT is still the evening of the 19th in Pacific.
      final result = parseOpertoTimestamp('20260620023000');
      expect(result, DateTime(2026, 6, 19, 19, 30, 0));
    });

    test('naive ISO string is treated as GMT and converted', () {
      // 2026-06-19T16:00:00 (no zone) -> 09:00 PDT.
      final result = parseOpertoTimestamp('2026-06-19T16:00:00');
      expect(result, DateTime(2026, 6, 19, 9, 0, 0));
    });

    test('ISO string with explicit Z is honored as UTC', () {
      final result = parseOpertoTimestamp('2026-06-19T16:00:00Z');
      expect(result, DateTime(2026, 6, 19, 9, 0, 0));
    });

    test('just after the spring-forward transition is PDT', () {
      // DST starts 2026-03-08 02:00 PST (10:00 GMT). 10:30 GMT -> 03:30 PDT.
      final result = parseOpertoTimestamp('20260308103000');
      expect(result, DateTime(2026, 3, 8, 3, 30, 0));
    });

    test('just before the spring-forward transition is PST', () {
      // 09:30 GMT on 2026-03-08 is before the 10:00 GMT switch -> 01:30 PST.
      final result = parseOpertoTimestamp('20260308093000');
      expect(result, DateTime(2026, 3, 8, 1, 30, 0));
    });

    test('returns null for empty or unparseable input', () {
      expect(parseOpertoTimestamp(''), isNull);
      expect(parseOpertoTimestamp('not-a-date'), isNull);
    });
  });

  group('parseOpertoDate', () {
    test('does not shift a date-only ISO value across the timezone', () {
      // A scheduled day is local with no time-of-day, so it must stay June 1
      // (not be pulled back to May 31 by the GMT->Pacific offset).
      expect(parseOpertoDate('2026-06-01'), DateTime(2026, 6, 1));
    });

    test('parses a plain YYYY/MM/DD date unchanged', () {
      expect(parseOpertoDate('2026/05/01'), DateTime(2026, 5, 1));
    });

    test('parses an 8-digit YYYYMMDD date unchanged', () {
      expect(parseOpertoDate('20260501'), DateTime(2026, 5, 1));
    });

    test('takes the literal calendar day from a 14-digit timestamp', () {
      // Schedule dates are not timezone-converted: the day is read as-is.
      expect(parseOpertoDate('20260601230000'), DateTime(2026, 6, 1));
    });
  });
}

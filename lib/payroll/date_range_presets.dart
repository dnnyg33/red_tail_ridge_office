/// Quick presets for the payroll date-range pickers, each returned as an
/// inclusive `(start, end)` pair.
///
/// Payroll runs on semi-monthly periods — the 1st–15th and the 16th–end of the
/// month — with whole calendar months used for monthly reporting.
library;

/// The previous whole calendar month: its 1st through its last day.
(DateTime, DateTime) lastCalendarMonth(DateTime now) => (
      DateTime(now.year, now.month - 1, 1),
      // Day 0 of this month is the last day of the previous one.
      DateTime(now.year, now.month, 0),
    );

/// The most recently finished semi-monthly pay period: the 1st–15th or the
/// 16th–end of the month, whichever ended most recently.
///
/// A period that ends today counts as finished, so this picks the 1st–15th when
/// run on the 15th and the second half when run on the last day of the month —
/// payroll is normally prepared on the period's final day.
(DateTime, DateTime) lastSemiMonthlyPeriod(DateTime now) {
  final lastDayOfMonth = DateTime(now.year, now.month + 1, 0).day;
  if (now.day == lastDayOfMonth) {
    return (
      DateTime(now.year, now.month, 16),
      DateTime(now.year, now.month, lastDayOfMonth),
    );
  }
  if (now.day >= 15) {
    return (
      DateTime(now.year, now.month, 1),
      DateTime(now.year, now.month, 15),
    );
  }
  // Before the 15th this month's first half is still open, so the most recent
  // finished period is the previous month's second half.
  final endOfPreviousMonth = DateTime(now.year, now.month, 0);
  return (
    DateTime(endOfPreviousMonth.year, endOfPreviousMonth.month, 16),
    endOfPreviousMonth,
  );
}

/// Operto sometimes returns numbers as JSON strings (e.g. `"3600"`), so parse
/// numerics leniently from either form.
int? opertoInt(Object? value) =>
    value is num ? value.toInt() : int.tryParse('${value ?? ''}'.trim());

double? opertoDouble(Object? value) =>
    value is num ? value.toDouble() : double.tryParse('${value ?? ''}'.trim());

/// Parses an Operto date that may arrive as a 14-digit timestamp
/// (`YYYYMMDDHHMMSS`), an 8-digit `YYYYMMDD`, an ISO string, or a
/// `YYYY/MM/DD`/`YYYY-MM-DD` string. Returns the date (time stripped), or null.
///
/// Unlike [parseOpertoTimestamp], this does **not** apply the GMT→Pacific
/// shift: a `TaskDate` denotes a scheduled calendar day in the properties'
/// local timezone with no meaningful time-of-day, so converting it would push
/// a date like `2026-06-01` back into the previous day and break the
/// schedule-date lookups that attribute properties to workers.
DateTime? parseOpertoDate(Object? value) {
  final s = value?.toString().trim() ?? '';
  if (s.isEmpty) return null;

  final ts = _parseTimestampComponents(s);
  if (ts != null) return DateTime(ts.year, ts.month, ts.day);

  if (s.length == 8 && int.tryParse(s) != null) {
    final y = int.tryParse(s.substring(0, 4));
    final m = int.tryParse(s.substring(4, 6));
    final d = int.tryParse(s.substring(6, 8));
    if (y != null && m != null && d != null) return DateTime(y, m, d);
  }

  final iso = DateTime.tryParse(s);
  if (iso != null) return DateTime(iso.year, iso.month, iso.day);

  final parts = s.split(RegExp(r'[/-]'));
  if (parts.length == 3) {
    final y = int.tryParse(parts[0].trim());
    final m = int.tryParse(parts[1].trim());
    final d = int.tryParse(parts[2].trim());
    if (y != null && m != null && d != null) return DateTime(y, m, d);
  }
  return null;
}

/// Operto commonly encodes timestamps as `YYYYMMDDHHMMSS`, e.g.
/// `20170625030227`, but some endpoints/versions return ISO-8601
/// (`2026-05-01T09:00:00`) instead. Parses the 14-digit form first, then falls
/// back to [DateTime.tryParse]. Returns null when nothing parses.
///
/// The API reports these timestamps in GMT, whereas the Operto CSV exports are
/// already localized to the properties' US Pacific timezone. To keep both
/// sources aligned (and to stop GMT evening times from spilling onto the next
/// calendar day), the parsed instant is interpreted as UTC and converted to
/// Pacific wall-clock — returned as a naive [DateTime] whose component fields
/// are the local values downstream code reads for the date and `HH:MM`.
DateTime? parseOpertoTimestamp(Object? value) {
  final parsed = _parseTimestampComponents(value?.toString().trim() ?? '');
  if (parsed == null) return null;
  // The components are GMT. A naive parse (14-digit form, or an ISO string with
  // no `Z`/offset) yields a non-UTC [DateTime], so reinterpret it as UTC before
  // converting; an instant that already carries a zone is used as-is.
  final utc = parsed.isUtc
      ? parsed
      : DateTime.utc(
          parsed.year,
          parsed.month,
          parsed.day,
          parsed.hour,
          parsed.minute,
          parsed.second,
          parsed.millisecond,
        );
  return _utcToPacific(utc);
}

/// Parses the literal Y/M/D H:M:S components of an Operto timestamp, with no
/// timezone conversion. Handles the 14-digit `YYYYMMDDHHMMSS` form first, then
/// falls back to [DateTime.tryParse]. Returns null when nothing parses.
DateTime? _parseTimestampComponents(String s) {
  if (s.isEmpty) return null;

  if (s.length == 14 && int.tryParse(s) != null) {
    int? part(int start, int end) => int.tryParse(s.substring(start, end));
    final year = part(0, 4);
    final month = part(4, 6);
    final day = part(6, 8);
    final hour = part(8, 10);
    final minute = part(10, 12);
    final second = part(12, 14);
    if (![year, month, day, hour, minute, second].contains(null)) {
      return DateTime(year!, month!, day!, hour!, minute!, second!);
    }
  }

  return DateTime.tryParse(s);
}

/// Converts a UTC instant to US Pacific wall-clock time, returned as a naive
/// (non-UTC) [DateTime] whose components are the local Pacific values.
///
/// Applies the US daylight-saving rule directly (no `package:timezone`): PDT
/// (UTC−7) from the second Sunday of March 02:00 local to the first Sunday of
/// November 02:00 local, otherwise PST (UTC−8). Valid for the single Pacific
/// timezone all Red Tail Ridge properties sit in (Albany/Corvallis/Philomath).
DateTime _utcToPacific(DateTime utc) {
  final local = utc.add(Duration(hours: _pacificIsDst(utc) ? -7 : -8));
  return DateTime(
    local.year,
    local.month,
    local.day,
    local.hour,
    local.minute,
    local.second,
    local.millisecond,
  );
}

/// Whether [utc] falls in Pacific daylight time. The transitions are defined in
/// local time but compared here in UTC: DST starts at 02:00 PST (= 10:00 UTC)
/// on the second Sunday of March and ends at 02:00 PDT (= 09:00 UTC) on the
/// first Sunday of November.
bool _pacificIsDst(DateTime utc) {
  final dstStart = _nthWeekdayOfMonth(utc.year, DateTime.march, DateTime.sunday, 2)
      .add(const Duration(hours: 10));
  final dstEnd = _nthWeekdayOfMonth(utc.year, DateTime.november, DateTime.sunday, 1)
      .add(const Duration(hours: 9));
  return !utc.isBefore(dstStart) && utc.isBefore(dstEnd);
}

/// UTC midnight of the [n]th [weekday] (1=Mon … 7=Sun) in [month] of [year].
DateTime _nthWeekdayOfMonth(int year, int month, int weekday, int n) {
  final first = DateTime.utc(year, month, 1);
  final delta = (weekday - first.weekday + 7) % 7;
  return first.add(Duration(days: delta + (n - 1) * 7));
}

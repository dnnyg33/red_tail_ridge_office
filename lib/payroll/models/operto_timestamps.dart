/// Operto sometimes returns numbers as JSON strings (e.g. `"3600"`), so parse
/// numerics leniently from either form.
int? opertoInt(Object? value) =>
    value is num ? value.toInt() : int.tryParse('${value ?? ''}'.trim());

double? opertoDouble(Object? value) =>
    value is num ? value.toDouble() : double.tryParse('${value ?? ''}'.trim());

/// Parses an Operto date that may arrive as a 14-digit timestamp
/// (`YYYYMMDDHHMMSS`), an 8-digit `YYYYMMDD`, an ISO string, or a
/// `YYYY/MM/DD`/`YYYY-MM-DD` string. Returns the date (time stripped), or null.
DateTime? parseOpertoDate(Object? value) {
  final s = value?.toString().trim() ?? '';
  if (s.isEmpty) return null;

  final ts = parseOpertoTimestamp(s);
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
DateTime? parseOpertoTimestamp(Object? value) {
  final s = value?.toString().trim() ?? '';
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

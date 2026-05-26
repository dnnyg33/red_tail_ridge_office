import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_assignments.freezed.dart';

@freezed
sealed class Assignment with _$Assignment {
  const factory Assignment({
    required String worker,
    required String date,
    required String property,
    required String task,
  }) = _Assignment;
}

/// Indexed view of the schedule CSV. Built once and queried per
/// (worker, date, property[, task]) to keep payroll calculations simple.
class ScheduleAssignments {
  ScheduleAssignments(List<Assignment> assignments)
      : assignments = List.unmodifiable(assignments),
        _index = _buildIndex(assignments);

  final List<Assignment> assignments;
  final Map<String, Map<String, Map<String, Set<String>>>> _index;

  bool isPropertyAssigned({
    required String worker,
    required String date,
    required String property,
  }) =>
      _index[worker]?[date]?.containsKey(property) ?? false;

  /// Total number of unique tasks assigned to [worker] across all properties
  /// on [date]. Used to size the per-shift leeway in NTT calculations.
  int taskCountFor({required String worker, required String date}) {
    final byProperty = _index[worker]?[date];
    if (byProperty == null) return 0;
    var total = 0;
    for (final tasks in byProperty.values) {
      total += tasks.length;
    }
    return total;
  }

  static Map<String, Map<String, Map<String, Set<String>>>> _buildIndex(
    List<Assignment> assignments,
  ) {
    final result = <String, Map<String, Map<String, Set<String>>>>{};
    for (final a in assignments) {
      result
          .putIfAbsent(a.worker, () => <String, Map<String, Set<String>>>{})
          .putIfAbsent(a.date, () => <String, Set<String>>{})
          .putIfAbsent(a.property, () => <String>{})
          .add(a.task);
    }
    return result;
  }
}

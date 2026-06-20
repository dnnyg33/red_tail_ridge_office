import 'package:freezed_annotation/freezed_annotation.dart';

import '../property_constants.dart';

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
        _index = _buildIndex(assignments),
        _propertiesByDate = _buildPropertiesByDate(assignments);

  final List<Assignment> assignments;
  final Map<String, Map<String, Map<String, Set<String>>>> _index;
  final Map<String, Map<String, Set<String>>> _propertiesByDate;

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

  /// Number of "Check Out Clean" tasks assigned to [worker] across the
  /// schedule. Each matching task occurrence counts as one clean.
  int checkoutCleanCountFor(String worker) {
    var count = 0;
    for (final a in assignments) {
      if (a.worker == worker &&
          a.task.toLowerCase().contains('check out clean')) {
        count++;
      }
    }
    return count;
  }

  /// Total drive-time minutes between consecutive property assignments for
  /// [worker] on [date], in CSV order. Returns 0 if fewer than two
  /// assignments exist.
  ///
  /// When [visitedProperties] is supplied, the assigned properties are first
  /// filtered to those the worker actually visited that day (per their task
  /// times), so drive time reflects the unique intersection of scheduled and
  /// visited properties — properties that were assigned but not visited (and
  /// inadvertent visits to unassigned properties) are excluded.
  int driveTimeFor({
    required String worker,
    required String date,
    Set<String>? visitedProperties,
  }) {
    var props = _propertiesByDate[worker]?[date]?.toList();
    if (props == null) return 0;
    if (visitedProperties != null) {
      props = [for (final p in props) if (visitedProperties.contains(p)) p];
    }
    var total = 0;
    for (var i = 1; i < props.length; i++) {
      total += driveTimeBetween(props[i - 1], props[i]);
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

  /// Unique assigned property names per worker per date.
  static Map<String, Map<String, Set<String>>> _buildPropertiesByDate(
    List<Assignment> assignments,
  ) {
    final result = <String, Map<String, Set<String>>>{};
    for (final a in assignments) {
      result
          .putIfAbsent(a.worker, () => <String, Set<String>>{})
          .putIfAbsent(a.date, () => <String>{})
          .add(a.property);
    }
    return result;
  }
}

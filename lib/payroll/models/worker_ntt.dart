import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_ntt.freezed.dart';

@freezed
sealed class WorkerNtt with _$WorkerNtt {
  const factory WorkerNtt({
    required String workerName,
    required List<ProposedNttRow> nttRows,
    required double totalNtt,
  }) = _WorkerNtt;
}

@freezed
sealed class ProposedNttRow with _$ProposedNttRow {
  const factory ProposedNttRow({
    required String date,
    required String shiftTotalTime,
    required String tasksTotalTime,
    required int properties,
    required int proposedNTT,
    required TimePair shift,
    required TimePair tasks,
  }) = _ProposedNttRow;
}


@freezed
sealed class TimePair with _$TimePair {
  const factory TimePair({
    required String first,
    required String last,
  }) = _TimePair;
}
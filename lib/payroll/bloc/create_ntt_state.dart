part of 'create_ntt_bloc.dart';

enum CreateNttStatus { initial, ready }

@freezed
abstract class CreateNttState with _$CreateNttState {
  const factory CreateNttState({
    @Default(CreateNttStatus.initial) CreateNttStatus status,
    String? timeTrackingTaskFileName,
    String? timeTrackingTaskFilePath,
    Uint8List? timeTrackingTaskBytes,
    @Default([]) List<TaskRow> workerRows,
  }) = _CreateNttState;
}


@freezed
sealed class TaskRow with _$TaskRow {
  const factory TaskRow({
    required String name,
    required String date,
    required String clockIn,
    required String clockOut,
    required String shiftTotalTime,
    required int propertyChanges,
    required int proposedNTT,
  }) = _TaskRow;
}
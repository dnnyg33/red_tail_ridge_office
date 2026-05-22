part of 'create_ntt_bloc.dart';

enum CreateNttStatus { initial, ready }

@freezed
abstract class CreateNttState with _$CreateNttState {
  const factory CreateNttState({
    @Default(CreateNttStatus.initial) CreateNttStatus status,
    String? timeTrackingTaskFileName,
    String? timeTrackingTaskFilePath,
    Uint8List? timeTrackingTaskBytes,
    // @Default([]) List<TaskRow> workerRows,
  }) = _CreateNttState;
}



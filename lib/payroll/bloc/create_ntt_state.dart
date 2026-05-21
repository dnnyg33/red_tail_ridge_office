part of 'create_ntt_bloc.dart';

enum CreateNttStatus { initial, ready }

@freezed
abstract class CreateNttState with _$CreateNttState {
  const factory CreateNttState({
    @Default(CreateNttStatus.initial) CreateNttStatus status,
  }) = _CreateNttState;
}
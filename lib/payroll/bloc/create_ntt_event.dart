part of 'create_ntt_bloc.dart';

@freezed
sealed class CreateNttEvent with _$CreateNttEvent {
  const factory CreateNttEvent.started() = CreateNttStarted;
}
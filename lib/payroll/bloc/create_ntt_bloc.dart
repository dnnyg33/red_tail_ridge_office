import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_ntt_event.dart';
part 'create_ntt_state.dart';
part 'create_ntt_bloc.freezed.dart';

class CreateNttBloc extends Bloc<CreateNttEvent, CreateNttState> {
  CreateNttBloc() : super(const CreateNttState()) {
    on<CreateNttStarted>(_onStarted);
  }

  void _onStarted(CreateNttStarted event, Emitter<CreateNttState> emit) {
    emit(state.copyWith(status: CreateNttStatus.ready));
  }
}
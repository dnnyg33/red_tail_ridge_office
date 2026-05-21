import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/mini_app.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState.initial()) {
    on<DashboardStarted>(_onStarted);
  }

  void _onStarted(DashboardStarted event, Emitter<DashboardState> emit) {
    emit(
      state.copyWith(
        miniApps: const [
          MiniApp(
            id: MiniAppId.preparePayroll,
            name: 'Prepare Payroll',
            description: 'Calculate and review payroll for the pay period.',
            icon: Icons.payments_outlined,
          ),
        ],
      ),
    );
  }
}
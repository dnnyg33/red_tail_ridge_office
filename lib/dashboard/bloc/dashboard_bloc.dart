import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/mini_app.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';


class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState()) {
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
          MiniApp(
            id: MiniAppId.connections,
            name: 'Connections',
            description: 'Connect Operto, Hostaway, and other data sources.',
            icon: Icons.cloud_sync_outlined,
          ),
        ],
      ),
    );
  }
}
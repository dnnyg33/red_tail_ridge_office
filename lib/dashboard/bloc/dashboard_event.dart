part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

final class DashboardStarted extends DashboardEvent {
  const DashboardStarted();
}

final class DashboardMiniAppOpened extends DashboardEvent {
  const DashboardMiniAppOpened(this.miniApp);

  final MiniApp miniApp;

  @override
  List<Object?> get props => [miniApp];
}
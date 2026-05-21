part of 'dashboard_bloc.dart';

@freezed
sealed class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.started() = DashboardStarted;
  const factory DashboardEvent.miniAppOpened(MiniApp miniApp) =
      DashboardMiniAppOpened;
}
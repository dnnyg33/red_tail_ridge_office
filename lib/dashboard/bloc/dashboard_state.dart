part of 'dashboard_bloc.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(<MiniApp>[]) List<MiniApp> miniApps,
  }) = _DashboardState;
}
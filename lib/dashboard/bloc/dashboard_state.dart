part of 'dashboard_bloc.dart';

final class DashboardState extends Equatable {
  const DashboardState({required this.miniApps});

  const DashboardState.initial() : miniApps = const [];

  final List<MiniApp> miniApps;

  DashboardState copyWith({List<MiniApp>? miniApps}) {
    return DashboardState(miniApps: miniApps ?? this.miniApps);
  }

  @override
  List<Object?> get props => [miniApps];
}
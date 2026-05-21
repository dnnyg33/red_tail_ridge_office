import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:red_tail_ridge_office/dashboard/bloc/dashboard_bloc.dart';
import 'package:red_tail_ridge_office/dashboard/models/mini_app.dart';

void main() {
  group('DashboardBloc', () {
    test('initial state has no mini apps', () {
      expect(DashboardBloc().state.miniApps, isEmpty);
    });

    blocTest<DashboardBloc, DashboardState>(
      'DashboardStarted emits state containing the Prepare Payroll mini app',
      build: DashboardBloc.new,
      act: (bloc) => bloc.add(const DashboardStarted()),
      expect: () => [
        isA<DashboardState>()
            .having((s) => s.miniApps.length, 'miniApps.length', 1)
            .having(
              (s) => s.miniApps.first.id,
              'miniApps.first.id',
              MiniAppId.preparePayroll,
            )
            .having(
              (s) => s.miniApps.first.name,
              'miniApps.first.name',
              'Prepare Payroll',
            ),
      ],
    );
  });
}
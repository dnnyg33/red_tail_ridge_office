import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/view/auth_page.dart';
import '../../payroll/view/prepare_payroll_page.dart';
import '../bloc/dashboard_bloc.dart';
import '../models/mini_app.dart';
import 'mini_app_tile.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc()..add(const DashboardStarted()),
      child: const DashboardView(),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Office Dashboard'),
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state.miniApps.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 240,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: state.miniApps.length,
              itemBuilder: (context, index) {
                final miniApp = state.miniApps[index];
                return MiniAppTile(
                  miniApp: miniApp,
                  onTap: () => _openMiniApp(context, miniApp),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _openMiniApp(BuildContext context, MiniApp miniApp) {
    switch (miniApp.id) {
      case MiniAppId.preparePayroll:
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const PreparePayrollPage(),
          ),
        );
      case MiniAppId.connections:
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const AuthPage(),
          ),
        );
    }
  }
}
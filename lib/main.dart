import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard/view/dashboard_page.dart';
import 'payroll/bloc/prepare_payroll_bloc.dart';

void main() {
  runApp(const RedTailRidgeOfficeApp());
}

class RedTailRidgeOfficeApp extends StatelessWidget {
  const RedTailRidgeOfficeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PreparePayrollBloc()..add(const PreparePayrollStarted()),
      child: MaterialApp(
        title: 'Red Tail Ridge Office',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DashboardPage(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'auth/bloc/auth_bloc.dart';
import 'dashboard/view/dashboard_page.dart';
import 'payroll/bloc/prepare_payroll_bloc.dart';
//TODO
//use hostaway api to get data for reviews and cleaning revenue.
//use operto api to get data (replace csv)
//add support/columns for monthly bonus:
// total pot = (3.5% of cleaning revenue - heath deductions)
// percent of pot = # of cleans / total # of cleans (contingent on passing performance review)
// total pot * percent of pot - callback deductions

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(dir.path),
  );
  runApp(const RedTailRidgeOfficeApp());
}

class RedTailRidgeOfficeApp extends StatelessWidget {
  const RedTailRidgeOfficeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(
          create: (_) =>
              PreparePayrollBloc()..add(const PreparePayrollStarted()),
        ),
      ],
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
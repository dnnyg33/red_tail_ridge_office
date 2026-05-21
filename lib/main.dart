import 'package:flutter/material.dart';

import 'dashboard/view/dashboard_page.dart';

void main() {
  runApp(const RedTailRidgeOfficeApp());
}

class RedTailRidgeOfficeApp extends StatelessWidget {
  const RedTailRidgeOfficeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Red Tail Ridge Office',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}
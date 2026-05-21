import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/create_ntt_bloc.dart';

class CreateNttPage extends StatelessWidget {
  const CreateNttPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateNttBloc()..add(const CreateNttStarted()),
      child: const CreateNttView(),
    );
  }
}

class CreateNttView extends StatelessWidget {
  const CreateNttView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Create NTT'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Create NTT csv form goes here.'),
      ),
    );
  }
}
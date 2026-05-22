import 'package:file_picker/file_picker.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TimeTrackingTaskFileField(),
          ],
        ),
      ),
    );
  }
}

class _TimeTrackingTaskFileField extends StatelessWidget {
  const _TimeTrackingTaskFileField();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<CreateNttBloc, CreateNttState>(
      buildWhen: (prev, curr) =>
          prev.timeTrackingTaskFileName != curr.timeTrackingTaskFileName,
      builder: (context, state) {
        return Row(
          children: [
            OutlinedButton.icon(
              onPressed: () => _pickFile(context),
              icon: const Icon(Icons.upload_file),
              label: const Text('Add "Time tracking task" csv'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                state.timeTrackingTaskFileName ?? 'No file selected',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: state.timeTrackingTaskFileName == null
                      ? theme.colorScheme.outline
                      : theme.colorScheme.onSurface,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickFile(BuildContext context) async {
    final bloc = context.read<CreateNttBloc>();
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['csv'],
      withData: true,
    );
    if (result == null || result.files.isEmpty) return;
    final picked = result.files.single;
    bloc.add(
      CreateNttTimeTrackingTaskFileSelected(
        fileName: picked.name,
        filePath: picked.path,
        bytes: picked.bytes,
      ),
    );
  }
}
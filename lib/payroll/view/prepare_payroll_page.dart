import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_utils/networking/async_operation.dart';
import 'package:flutter_utils/widgets/alerts/show_alert.dart';
import 'package:red_tail_ridge_office/payroll/models/worker_ntt.dart';
import 'package:red_tail_ridge_office/payroll/models/worker_row.dart';

import '../bloc/prepare_payroll_bloc.dart';

class PreparePayrollPage extends StatelessWidget {
  const PreparePayrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Prepare Payroll'),
      ),
      body: BlocBuilder<PreparePayrollBloc, PreparePayrollState>(
        builder: (context, state) {
          return switch (state.workerRows.status) {
            AsyncOperationStatus.processing =>
              const Center(child: CircularProgressIndicator()),
            AsyncOperationStatus.error => Center(
              child: Column(
                children: [
                  Text(state.workerRows.error ?? 'Unable to load payroll.'),
                  _GenerateReportButton(),
                ],
              ),
            ),
          AsyncOperationStatus.idle ||
            AsyncOperationStatus.success =>
              _PreparePayrollBody(state: state),
          };
        },
      ),
    );
  }
}

class _PreparePayrollBody extends StatelessWidget {
  const _PreparePayrollBody({required this.state});

  final PreparePayrollState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TimeTrackingFileField(),
          SizedBox(height: 12),
          _NttFileField(),
          SizedBox(height: 12),
          _ScheduleFileField(),
          SizedBox(height: 24),
          _MileageConstantField(),
          SizedBox(height: 24),
          _GenerateReportButton(),
          SizedBox(height: 24),
          Expanded(child: _WorkerRowsTable(state.workerRows.data)),
        ],
      ),
    );
  }
}

class _TimeTrackingFileField extends StatelessWidget {
  const _TimeTrackingFileField();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<PreparePayrollBloc, PreparePayrollState>(
      buildWhen: (prev, curr) =>
          prev.timeTrackingFile != curr.timeTrackingFile,
      builder: (context, state) {
        return Row(
          children: [
            IconButton(
                onPressed: () => showAlert(context, title: "Special Instructions", message: "These are the reported shifts. Include all staff during a given period"),
                icon: Icon(Icons.help)),
            OutlinedButton.icon(
              onPressed: () =>
                  _pickFile(context, onSelected: (picked) {
                    final bloc = context.read<PreparePayrollBloc>();
                    bloc.add(PreparePayrollTimeTrackingFileSelected(picked));
                  }),
              icon: const Icon(Icons.upload_file),
              label: const Text("Add 'Time Tracking Employee/Days' csv"),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                state.timeTrackingFile?.name ?? 'No file selected',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: state.timeTrackingFile == null
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

}

class _NttFileField extends StatelessWidget {
  const _NttFileField();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<PreparePayrollBloc, PreparePayrollState>(
      buildWhen: (prev, curr) => prev.nttFile != curr.nttFile,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              IconButton(
                  onPressed: () => showAlert(context, title: "Special Instructions", message: "This is the reported task time. Include all staff during a given period and sort by 'Employee'"),
                  icon: Icon(Icons.help)),
              OutlinedButton.icon(
                onPressed: () =>
                    _pickFile(context, onSelected: (picked) {
                      final bloc = context.read<PreparePayrollBloc>();
                      bloc.add(PreparePayrollNttFileSelected(picked));
                    }),
                icon: const Icon(Icons.upload_file),
                label: const Text("Add 'Time Tracking Tasks' csv"),
              ),
              const SizedBox(width: 8),
              Text(
                state.nttFile?.name ?? 'No file selected',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: state.nttFile == null
                      ? theme.colorScheme.outline
                      : theme.colorScheme.onSurface,
                ),
              ),
            ]),
          ],
        );
      },
    );
  }
}

class _ScheduleFileField extends StatelessWidget {
  const _ScheduleFileField();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<PreparePayrollBloc, PreparePayrollState>(
      buildWhen: (prev, curr) => prev.scheduleFile != curr.scheduleFile,
      builder: (context, state) {
        return Row(
          children: [
            IconButton(
                onPressed: () => showAlert(context, title: "Special Instructions", message: "This is the scheduled tasks/properties list. Select 'In Progress tasks' and 'Completed Tasks Only' for a given period"),
                icon: Icon(Icons.help)),
            OutlinedButton.icon(
              onPressed: () =>
                  _pickFile(context, onSelected: (picked) {
                    final bloc = context.read<PreparePayrollBloc>();
                    bloc.add(PreparePayrollScheduleFileSelected(picked));
                  }),
              icon: const Icon(Icons.upload_file),
              label: const Text("Add 'Quick reports/Tasks' csv"),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                state.scheduleFile?.name ?? 'No file selected',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: state.scheduleFile == null
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
}

Future<void> _pickFile(BuildContext context,
    {required Function(PlatformFile file) onSelected,}) async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: const ['csv'],
    withData: true,
    initialDirectory: 'Downloads'
  );
  if (result == null || result.files.isEmpty) return;
  final picked = result.files.single;
  onSelected(picked);
}

class _MileageConstantField extends StatelessWidget {
  const _MileageConstantField();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PreparePayrollBloc>();
    return SizedBox(
      width: 240,
      child: TextFormField(
        initialValue: bloc.state.mileageConstant?.toString(),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        ],
        decoration: const InputDecoration(
          labelText: 'Mileage constant',
          border: OutlineInputBorder(),
        ),
        onChanged: (raw) {
          final trimmed = raw.trim();
          final value = trimmed.isEmpty ? null : double.tryParse(trimmed);
          bloc.add(PreparePayrollMileageConstantChanged(value));
        },
      ),
    );
  }
}

class _GenerateReportButton extends StatelessWidget {
  const _GenerateReportButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreparePayrollBloc, PreparePayrollState>(
      buildWhen: (prev, curr) =>
          prev.canGenerateReport != curr.canGenerateReport ||
          prev.workerRows != curr.workerRows,
      builder: (context, state) {
        return Align(
          alignment: Alignment.centerRight,
          child: FilledButton.icon(
            onPressed: state.canGenerateReport
                ? () => context
                    .read<PreparePayrollBloc>()
                    .add(const PreparePayrollReportRequested())
                : null,
            icon: const Icon(Icons.play_arrow),
            label: const Text('Generate report'),
          ),
        );
      },
    );
  }
}

class _WorkerRowsTable extends StatelessWidget {
  const _WorkerRowsTable(this.workerRows);
  final List<WorkerRow>? workerRows;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreparePayrollBloc, PreparePayrollState>(
      buildWhen: (prev, curr) =>
          prev.workerRows != curr.workerRows ||
          prev.payPeriodStart != curr.payPeriodStart ||
          prev.payPeriodEnd != curr.payPeriodEnd,
      builder: (context, state) {
        if (workerRows == null || workerRows!.isEmpty) {
          return const SizedBox.shrink();
        }
        final title = _titleRange(state.payPeriodStart, state.payPeriodEnd);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: DataTable2(
                minWidth: 1100,
                fixedTopRows: 1,
                fixedLeftColumns: 1,
                headingRowHeight: 72,
                columns: const [
                  // DataColumn2(label: _HeaderLabel('#'), fixedWidth: 8),
                  DataColumn2(label: _HeaderLabel('Worker')),
                  DataColumn2(label: _HeaderLabel('Dates'), size: ColumnSize.L),
                  DataColumn2(label: _HeaderLabel('Hours'), numeric: true),
                  DataColumn2(label: _HeaderLabel('Breaks/NTT'), numeric: true),
                  DataColumn2(label: _HeaderLabel('Pay rate'), numeric: true),
                  DataColumn2(label: _HeaderLabel('Mileage'), numeric: true),
                  DataColumn2(label: _HeaderLabel('Mileage pay'), numeric: true),
                  DataColumn2(label: _HeaderLabel('Hourly pay minus breaks/NTT'), numeric: true),
                  DataColumn2(label: _HeaderLabel('Hourly pay & Drive'), numeric: true),
                ],
                rows: [
                  for (final (i, r) in workerRows!.indexed)
                    DataRow2(
                      color: i.isOdd
                          ? WidgetStateProperty.all(
                              Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest
                                  .withValues(alpha: 0.4),
                            )
                          : null,
                      cells: [
                        // DataCell(Text('${i + 1}')),
                        DataCell(
                          TextButton(
                            onPressed: r.nttRows.isEmpty
                                ? null
                                : () => _showNttRowsDialog(context, r),
                            child: Text(r.worker),
                          ),
                        ),
                        DataCell(Text(_rowRange(r.periodStart, r.periodEnd))),
                        DataCell(Text(r.periodHours.toStringAsFixed(2))),
                        DataCell(Text(r.periodBreaks)),
                        DataCell(Text(_money(r.payRate))),
                        DataCell(Text(r.mileageForPeriod.toStringAsFixed(0))),
                        DataCell(Text(_money(r.mileagePay))),
                        DataCell(Text(_money(r.periodHourlyPay))),
                        DataCell(Text(_money(r.totalPeriodPay))),
                      ],
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _showNttRowsDialog(BuildContext context, WorkerRow row) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        insetPadding: const EdgeInsets.all(24),
        title: Text('${row.worker} – Proposed NTT'),
        content: SizedBox(
          width: MediaQuery.of(dialogContext).size.width,
          height: MediaQuery.of(dialogContext).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
              columns: const [
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Shift')),
                DataColumn(label: Text('Shift total')),
                DataColumn(label: Text('Tasks')),
                DataColumn(label: Text('Tasks total')),
                DataColumn(label: Text('Properties'), numeric: true),
                DataColumn(label: Text('Proposed NTT (min)'), numeric: true),
              ],
              rows: [
                for (final n in row.nttRows)
                  DataRow(
                    color: n.inadvertentProperties.isNotEmpty
                        ? WidgetStateProperty.all(
                            Theme.of(context)
                                .colorScheme
                                .errorContainer
                                .withValues(alpha: 0.4),
                          )
                        : null,
                    cells: [
                      DataCell(Text(n.date)),
                      DataCell(Text(_timePair(n.shift))),
                      DataCell(Text(n.shiftTotalTime)),
                      DataCell(Text(_timePair(n.tasks))),
                      DataCell(Text(n.tasksTotalTime)),
                      DataCell(_PropertiesCell(row: n)),
                      DataCell(
                        Tooltip(
                          message: n.math,
                          child: Text(n.proposedNTT.toString()),
                        ),
                      ),
                    ],
                  ),
              ],
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  String _timePair(TimePair p) {
    if (p.first.isEmpty && p.last.isEmpty) return '—';
    return '${p.first.isEmpty ? '?' : p.first} – ${p.last.isEmpty ? '?' : p.last}';
  }

  String _money(double value) => '\$${value.toStringAsFixed(2)}';

  String _rowRange(DateTime? start, DateTime? end) {
    if (start == null && end == null) return '—';
    if (start == null) return _shortDate(end!);
    if (end == null) return _shortDate(start);
    if (_sameDay(start, end)) return _shortDate(start);
    return '${_shortDate(start)} – ${_shortDate(end)}';
  }

  String _titleRange(DateTime? start, DateTime? end) {
    if (start == null || end == null) return 'Worker pay';
    if (_sameDay(start, end)) return 'Pay period: ${_longDate(start)}';
    if (start.year == end.year) {
      return 'Pay period: ${_monthDay(start)} – ${_monthDay(end)}, ${end.year}';
    }
    return 'Pay period: ${_longDate(start)} – ${_longDate(end)}';
  }

  bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  String _shortDate(DateTime d) => '${d.month}/${d.day}';

  String _monthDay(DateTime d) => '${_monthName(d.month)} ${d.day}';

  String _longDate(DateTime d) =>
      '${_monthName(d.month)} ${d.day}, ${d.year}';

  String _monthName(int month) => const [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ][month - 1];
}

class _HeaderLabel extends StatelessWidget {
  const _HeaderLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      maxLines: 3,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class _PropertiesCell extends StatelessWidget {
  const _PropertiesCell({required this.row});

  final ProposedNttRow row;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasInadvertent = row.inadvertentProperties.isNotEmpty;
    if (!hasInadvertent) return Text(row.properties.toString());
    return Tooltip(
      message:
          'Not in schedule: ${row.inadvertentProperties.join(', ')}',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            row.properties.toString(),
            style: TextStyle(
              color: theme.colorScheme.error,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.warning_amber_rounded,
            size: 16,
            color: theme.colorScheme.error,
          ),
        ],
      ),
    );
  }
}
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
    // The table (DataTable2) needs a bounded height to keep its frozen
    // header/column, so give it a viewport-relative height inside the
    // page-level scroll view.
    final hasRows = state.workerRows.data?.isNotEmpty ?? false;
    final tableHeight = MediaQuery.sizeOf(context).height * 0.7;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            child: ExpansionTile(
              initiallyExpanded: true,
              title: const Text('Inputs'),
              childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TimeTrackingFileField(),
                SizedBox(height: 12),
                _NttFileField(),
                SizedBox(height: 12),
                _ScheduleFileField(),
                SizedBox(height: 24),
                Row(
                  children: [
                    _MileageConstantField(),
                    SizedBox(width: 16),
                    _HeathDeductionsField(),
                    SizedBox(width: 16),
                    _CleaningRevenueField(),
                  ],
                ),
                SizedBox(height: 24),
                _GenerateReportButton(),
              ],
            ),
          ),
          SizedBox(height: 24),
          SizedBox(
            height: hasRows ? tableHeight : null,
            child: _WorkerRowsTable(state.workerRows.data),
          ),
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

class _HeathDeductionsField extends StatelessWidget {
  const _HeathDeductionsField();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PreparePayrollBloc>();
    return SizedBox(
      width: 240,
      child: TextFormField(
        initialValue: bloc.state.heathDeductions?.toString(),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        ],
        decoration: const InputDecoration(
          labelText: 'Heath deductions',
          border: OutlineInputBorder(),
        ),
        onChanged: (raw) {
          final trimmed = raw.trim();
          final value = trimmed.isEmpty ? null : double.tryParse(trimmed);
          bloc.add(PreparePayrollHeathDeductionsChanged(value));
        },
      ),
    );
  }
}

class _CleaningRevenueField extends StatelessWidget {
  const _CleaningRevenueField();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PreparePayrollBloc>();
    return SizedBox(
      width: 240,
      child: TextFormField(
        initialValue: bloc.state.cleaningRevenue?.toString(),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        ],
        decoration: const InputDecoration(
          labelText: 'Cleaning revenue',
          border: OutlineInputBorder(),
        ),
        onChanged: (raw) {
          final trimmed = raw.trim();
          final value = trimmed.isEmpty ? null : double.tryParse(trimmed);
          bloc.add(PreparePayrollCleaningRevenueChanged(value));
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
          prev.payPeriodEnd != curr.payPeriodEnd ||
          prev.cleaningRevenue != curr.cleaningRevenue ||
          prev.heathDeductions != curr.heathDeductions,
      builder: (context, state) {
        if (workerRows == null || workerRows!.isEmpty) {
          return const SizedBox.shrink();
        }
        final title = _titleRange(state.payPeriodStart, state.payPeriodEnd);
        final bonusPot = state.bonusPot;
        final totalCleans = state.totalCleans;
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
                  // DataColumn2(label: _HeaderLabel('Dates'), size: ColumnSize.L),
                  DataColumn2(label: _HeaderLabel('Net Hours'), numeric: true, tooltip: 'Clocked in time - NTT'),
                  DataColumn2(label: _HeaderLabel('Pay rate'), numeric: true),
                  DataColumn2(label: _HeaderLabel('Gross'), numeric: true, tooltip: 'Pay rate * net hours'),
                  DataColumn2(label: _HeaderLabel('Mileage'), numeric: true),
                  DataColumn2(label: _HeaderLabel('Mileage pay'), numeric: true),
                  DataColumn2(label: _HeaderLabel('Hourly pay & Drive'), numeric: true),
                  DataColumn2(label: _HeaderLabel('Bonus pay'), numeric: true),
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
                        DataCell(
                          Tooltip(
                            message:
                                '${r.periodHours.toStringAsFixed(2)} clocked in − '
                                '${r.periodNtt.toStringAsFixed(2)} NTT',
                            child: Text(r.netHours.toStringAsFixed(2)),
                          ),
                        ),
                        DataCell(Text(_money(r.payRate))),
                        DataCell(
                          Tooltip(
                            message:
                                '${_money(r.payRate)} × ${r.netHours.toStringAsFixed(2)} net hrs',
                            child: Text(_money(r.periodHourlyPay)),
                          ),
                        ),
                        DataCell(Text(r.mileageForPeriod.toStringAsFixed(0))),
                        DataCell(Text(_money(r.mileagePay))),
                        DataCell(Text(_money(r.totalPeriodPay))),
                        DataCell(
                          TextButton(
                            onPressed: () => _showBonusDialog(
                              context,
                              row: r,
                              state: state,
                              pot: bonusPot,
                              totalCleans: totalCleans,
                            ),
                            child: Text(_money(
                              r.bonusPay(pot: bonusPot, totalCleans: totalCleans),
                            )),
                          ),
                        ),
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

  void _showBonusDialog(
    BuildContext context, {
    required WorkerRow row,
    required PreparePayrollState state,
    required double pot,
    required int totalCleans,
  }) {
    final revenue = state.cleaningRevenue ?? 0;
    final revenueShare = 0.035 * revenue;
    final heath = state.heathDeductions ?? 0;
    final share = totalCleans <= 0 ? 0.0 : row.cleans / totalCleans;
    final grossShare = pot * share;
    final bonus = row.bonusPay(pot: pot, totalCleans: totalCleans);

    String pct(double v) => '${(v * 100).toStringAsFixed(1)}%';

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('${row.worker} – Bonus pay'),
        content: SizedBox(
          width: 420,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _bonusLine('Cleaning revenue', _money(revenue)),
              _bonusLine('× 3.5%', _money(revenueShare)),
              _bonusLine('− Heath deductions', '−${_money(heath)}'),
              const Divider(),
              _bonusLine('Total pot', _money(pot), bold: true),
              const SizedBox(height: 12),
              _bonusLine("This worker's cleans", '${row.cleans}'),
              _bonusLine('Total cleans', '$totalCleans'),
              _bonusLine('Share of pot', pct(share)),
              const Divider(),
              _bonusLine('Pot × share', _money(grossShare)),
              _bonusLine('− Callback deductions', '−${_money(0)}'),
              const Divider(),
              _bonusLine('Bonus pay', _money(bonus), bold: true),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _bonusLine(String label, String value, {bool bold = false}) {
    final style = bold ? const TextStyle(fontWeight: FontWeight.bold) : null;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
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
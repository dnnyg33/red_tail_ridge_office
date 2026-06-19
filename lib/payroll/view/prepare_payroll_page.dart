import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_utils/networking/async_operation.dart';
import 'package:flutter_utils/widgets/alerts/show_alert.dart';
import 'package:red_tail_ridge_office/payroll/models/staff.dart';
import 'package:red_tail_ridge_office/payroll/models/worker_ntt.dart';
import 'package:red_tail_ridge_office/payroll/models/worker_row.dart';

import '../bloc/prepare_payroll_bloc.dart';
import '../service/operto_api.dart';
import '../service/pay_rate_file_saver.dart';

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
                _OpertoShiftsField(),
                SizedBox(height: 12),
                _PayRateFileField(),
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

/// Operto-backed replacement for the "Time Tracking Employee/Days" shift CSV:
/// pick a start/end date and pull StaffDayTimes straight from the API.
class _OpertoShiftsField extends StatelessWidget {
  const _OpertoShiftsField();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<PreparePayrollBloc, PreparePayrollState>(
      buildWhen: (prev, curr) =>
          prev.startDate != curr.startDate ||
          prev.endDate != curr.endDate ||
          prev.staffDayTimes != curr.staffDayTimes ||
          prev.canFetchStaffDayTimes != curr.canFetchStaffDayTimes,
      builder: (context, state) {
        final bloc = context.read<PreparePayrollBloc>();
        final staffDayTimes = state.staffDayTimes;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => showAlert(
                    context,
                    title: 'Operto data',
                    message:
                        'Pull staff clock in/out (StaffDayTimes) and task time '
                        '(StaffTaskTimes) from Operto for the selected date '
                        'range, replacing the time-tracking CSV uploads.',
                  ),
                  icon: const Icon(Icons.help),
                ),
                _DateField(
                  label: 'Start date',
                  value: state.startDate,
                  onChanged: (date) =>
                      bloc.add(PreparePayrollEvent.startDateChanged(date)),
                ),
                const SizedBox(width: 12),
                _DateField(
                  label: 'End date',
                  value: state.endDate,
                  firstDate: state.startDate,
                  onChanged: (date) =>
                      bloc.add(PreparePayrollEvent.endDateChanged(date)),
                ),
                const SizedBox(width: 12),
                FilledButton.tonalIcon(
                  onPressed: state.canFetchStaffDayTimes
                      ? () => bloc.add(
                            const PreparePayrollEvent.staffDayTimesRequested(),
                          )
                      : null,
                  icon: staffDayTimes.isProcessing
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.cloud_download_outlined),
                  label: const Text('Fetch Operto data'),
                ),
              ],
            ),
            if (staffDayTimes.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 48, top: 4),
                child: Text(
                  staffDayTimes.error!,
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: theme.colorScheme.error),
                ),
              )
            else if (staffDayTimes.isSuccess)
              Padding(
                padding: const EdgeInsets.only(left: 48, top: 4),
                child: Text(
                  'Fetched ${staffDayTimes.successData.length} shifts and '
                  '${state.staffTaskTimes.length} task times.',
                  style: theme.textTheme.bodySmall,
                ),
              ),
          ],
        );
      },
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({
    required this.label,
    required this.value,
    required this.onChanged,
    this.firstDate,
  });

  final String label;
  final DateTime? value;
  final DateTime? firstDate;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () async {
        final now = DateTime.now();
        final picked = await showDatePicker(
          context: context,
          initialDate: value ?? firstDate ?? now,
          firstDate: firstDate ?? DateTime(now.year - 5),
          lastDate: DateTime(now.year + 1),
        );
        if (picked != null) onChanged(picked);
      },
      icon: const Icon(Icons.calendar_today, size: 16),
      label: Text(value == null ? label : '$label: ${_format(value!)}'),
    );
  }

  String _format(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

class _PayRateFileField extends StatelessWidget {
  const _PayRateFileField();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<PreparePayrollBloc, PreparePayrollState>(
      buildWhen: (prev, curr) => prev.payRateFile != curr.payRateFile,
      builder: (context, state) {
        return Row(
          children: [
            IconButton(
                onPressed: () => showAlert(
                      context,
                      title: 'Special Instructions',
                      message:
                          'Pay rates are not available from the Operto API, so '
                          'upload a JSON array of objects with name, payRate, '
                          'and workerId — one per worker, e.g.\n\n'
                          '[\n'
                          '  {"name": "Alice", "payRate": 22.50, "workerId": 132},\n'
                          '  {"name": "Bob", "payRate": 20.00, "workerId": 134}\n'
                          ']',
                    ),
                icon: const Icon(Icons.help)),
            OutlinedButton.icon(
              onPressed: () => _pickFile(
                context,
                extensions: const ['json'],
                onSelected: (picked) {
                  final bloc = context.read<PreparePayrollBloc>();
                  bloc.add(PreparePayrollEvent.payRateFileSelected(picked));
                },
              ),
              icon: const Icon(Icons.upload_file),
              label: const Text('Add pay rates (json)'),
            ),
            const SizedBox(width: 8),
            const _GeneratePayRateFileButton(),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                state.payRateFile?.name ?? 'No file selected',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: state.payRateFile == null
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
    {required Function(PlatformFile file) onSelected,
    List<String> extensions = const ['csv'],}) async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: extensions,
    withData: true,
    initialDirectory: 'Downloads'
  );
  if (result == null || result.files.isEmpty) return;
  final picked = result.files.single;
  onSelected(picked);
}

/// Fetches all Operto staff, then opens the [_PayRateEditorDialog] so the user
/// can enter each worker's pay rate and export a pay-rate JSON file.
class _GeneratePayRateFileButton extends StatefulWidget {
  const _GeneratePayRateFileButton();

  @override
  State<_GeneratePayRateFileButton> createState() =>
      _GeneratePayRateFileButtonState();
}

class _GeneratePayRateFileButtonState
    extends State<_GeneratePayRateFileButton> {
  bool _loading = false;

  Future<void> _onPressed() async {
    final bloc = context.read<PreparePayrollBloc>();
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _loading = true);
    try {
      // Only offer workers who actually have shifts in the fetched period.
      final idsWithShifts = bloc.state.staffIdsWithShifts;
      final staff = (await bloc.fetchStaffForPayRates())
          .where((s) => idsWithShifts.contains(s.id))
          .toList();
      if (!mounted) return;
      await showDialog<void>(
        context: context,
        builder: (_) => _PayRateEditorDialog(staff: staff),
      );
    } on OpertoApiException catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.message)));
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text('Failed to load staff: $e')),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ready = context.select<PreparePayrollBloc, bool>(
      (bloc) => bloc.state.hasFetchedStaffDayTimes,
    );
    return Tooltip(
      message: ready
          ? 'Generate a pay rate file for workers with shifts this period'
          : 'Fetch Operto data first',
      child: OutlinedButton.icon(
        onPressed: (_loading || !ready) ? null : _onPressed,
        icon: _loading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.request_quote),
        label: const Text('Generate pay rate file'),
      ),
    );
  }
}

/// Editable table of staff with a pay-rate field each. On save, writes a JSON
/// array of `{ name, payRate, workerId }` objects via a native save dialog.
class _PayRateEditorDialog extends StatefulWidget {
  const _PayRateEditorDialog({required this.staff});

  final List<Staff> staff;

  @override
  State<_PayRateEditorDialog> createState() => _PayRateEditorDialogState();
}

class _PayRateEditorDialogState extends State<_PayRateEditorDialog> {
  late final List<Staff> _staff;
  late final Map<int, TextEditingController> _controllers;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _staff = [...widget.staff]
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    _controllers = {
      for (final s in _staff) s.id: TextEditingController(),
    };
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    final entries = [
      for (final s in _staff)
        {
          'name': s.name,
          'payRate': double.tryParse(_controllers[s.id]!.text.trim()) ?? 0,
          'workerId': s.id,
        },
    ];
    final bytes = utf8.encode(
      const JsonEncoder.withIndent('  ').convert(entries),
    );

    setState(() => _saving = true);
    try {
      final path = await savePayRateFile(
        fileName: 'pay_rates.json',
        bytes: bytes,
      );
      if (!mounted) return;
      if (path == null) {
        setState(() => _saving = false);
        return; // user cancelled the save dialog
      }
      navigator.pop();
      messenger.showSnackBar(
        const SnackBar(content: Text('Pay rate file saved.')),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _saving = false);
      messenger.showSnackBar(
        SnackBar(content: Text('Failed to save file: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Generate Pay Rate File'),
      content: SizedBox(
        width: 520,
        height: MediaQuery.sizeOf(context).height * 0.6,
        child: _staff.isEmpty
            ? const Center(child: Text('No workers with shifts this period.'))
            : SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Worker ID')),
                    DataColumn(label: Text('Pay rate')),
                  ],
                  rows: [
                    for (final s in _staff)
                      DataRow(cells: [
                        DataCell(Text(s.name)),
                        DataCell(Text('${s.id}')),
                        DataCell(SizedBox(
                          width: 120,
                          child: TextField(
                            controller: _controllers[s.id],
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d*'),
                              ),
                            ],
                            decoration: const InputDecoration(
                              prefixText: '\$ ',
                              isDense: true,
                              hintText: '0.00',
                            ),
                          ),
                        )),
                      ]),
                  ],
                ),
              ),
      ),
      actions: [
        TextButton(
          onPressed: _saving ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _saving || _staff.isEmpty ? null : _save,
          child: _saving
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Save'),
        ),
      ],
    );
  }
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
          bloc.add(PreparePayrollEvent.mileageConstantChanged(value));
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
          bloc.add(PreparePayrollEvent.heathDeductionsChanged(value));
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
          bloc.add(PreparePayrollEvent.cleaningRevenueChanged(value));
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
                    .add(const PreparePayrollEvent.reportRequested())
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
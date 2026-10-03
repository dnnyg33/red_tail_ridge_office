import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_utils/networking/async_operation.dart';
import 'package:flutter_utils/widgets/alerts/show_alert.dart';
import 'package:red_tail_ridge_office/payroll/models/worker_ntt.dart';
import 'package:red_tail_ridge_office/payroll/models/worker_row.dart';

import '../bloc/prepare_payroll_bloc.dart';
import '../date_range_presets.dart';

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
            AsyncOperationStatus.processing => const Center(
              child: CircularProgressIndicator(),
            ),
            AsyncOperationStatus.idle ||
            AsyncOperationStatus.error ||
            AsyncOperationStatus.success => _PreparePayrollBody(state: state),
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
                _BonusEligibilityField(),
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
              ],
            ),
          ),
          if (state.workerRows.hasError) ...[
            const SizedBox(height: 16),
            _ReportErrorBanner(message: state.workerRows.error),
          ],
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
                        'Pull staff clock in/out (StaffDayTimes), task time '
                        '(StaffTaskTimes) and task assignments (StaffTasks, '
                        'which carry each worker\'s pay rate) from Operto for '
                        'the selected date range, replacing the time-tracking '
                        'CSV uploads.',
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
            const _DateRangePresets(),
            if (staffDayTimes.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 48, top: 4),
                child: Text(
                  staffDayTimes.error!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.error,
                  ),
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

/// One-tap fills for the date fields, aligned under them (the 48px indent
/// clears the help icon). Each button only sets the dates — the user still
/// presses "Fetch Operto data" — and its tooltip names the range it resolves
/// to, since "last period" depends on today's date.
class _DateRangePresets extends StatelessWidget {
  const _DateRangePresets();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PreparePayrollBloc>();
    final now = DateTime.now();
    final presets = <String, (DateTime, DateTime)>{
      'Last month': lastCalendarMonth(now),
      'Last period': lastSemiMonthlyPeriod(now),
    };
    return Padding(
      padding: const EdgeInsets.only(left: 48),
      child: Row(
        children: [
          for (final MapEntry(key: label, value: (start, end))
              in presets.entries)
            Tooltip(
              message: '${_isoDate(start)} – ${_isoDate(end)}',
              child: TextButton(
                onPressed: () => bloc
                  ..add(PreparePayrollEvent.startDateChanged(start))
                  ..add(PreparePayrollEvent.endDateChanged(end)),
                child: Text(label),
              ),
            ),
        ],
      ),
    );
  }
}

String _isoDate(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-'
    '${d.day.toString().padLeft(2, '0')}';

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
      label: Text(value == null ? label : '$label: ${_isoDate(value!)}'),
    );
  }
}

/// Bonus eligibility — the one payroll input Operto can't supply. Pay rates
/// come from each Operto task's own `PayRate`, so there's no pay-rate file to
/// upload any more; all that's left to enter by hand is who qualifies for the
/// bonus, and that selection persists across runs.
class _BonusEligibilityField extends StatelessWidget {
  const _BonusEligibilityField();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<PreparePayrollBloc, PreparePayrollState>(
      buildWhen: (prev, curr) =>
          prev.qualifiesForBonusById != curr.qualifiesForBonusById ||
          prev.staffDayTimes != curr.staffDayTimes,
      builder: (context, state) {
        final withShifts = state.staffIdsWithShifts;
        final qualifying = withShifts
            .where((id) => state.qualifiesForBonusById[id] == true)
            .length;
        final ready = state.hasFetchedStaffDayTimes;
        return Row(
          children: [
            IconButton(
              onPressed: () => showAlert(
                context,
                title: 'Bonus eligibility',
                message:
                    'Pay rates now come straight from Operto (each task\'s '
                    'PayRate), so no pay-rate file is needed. Operto has no '
                    'notion of bonus eligibility though, so pick which workers '
                    'passed their performance review here — their cleans earn '
                    'a share of the bonus pot. The choice is remembered '
                    'between runs.',
              ),
              icon: const Icon(Icons.help),
            ),
            OutlinedButton.icon(
              onPressed: ready
                  ? () => showDialog<void>(
                        context: context,
                        builder: (_) => const _BonusEligibilityDialog(),
                      )
                  : null,
              icon: const Icon(Icons.workspace_premium_outlined),
              label: const Text('Bonus eligibility'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                ready
                    ? '$qualifying of ${withShifts.length} '
                        'workers qualify for the bonus'
                    : 'Fetch Operto data to choose who qualifies',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: ready
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.outline,
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

/// Checkbox list of the workers with shifts this period, toggling whether each
/// one's cleans earn a share of the bonus pot. Saving dispatches the whole map
/// at once, merged over the stored one so workers outside this period keep
/// their setting.
class _BonusEligibilityDialog extends StatefulWidget {
  const _BonusEligibilityDialog();

  @override
  State<_BonusEligibilityDialog> createState() =>
      _BonusEligibilityDialogState();
}

class _BonusEligibilityDialogState extends State<_BonusEligibilityDialog> {
  /// `(staffId, name)` for every worker with a shift this period, by name.
  late final List<(int, String)> _workers;

  /// Working copy of the eligibility flags, committed on save.
  late final Map<int, bool> _draft;

  @override
  void initState() {
    super.initState();
    final state = context.read<PreparePayrollBloc>().state;
    _workers = [
      for (final id in state.staffIdsWithShifts)
        (id, state.staffNamesById[id] ?? 'Staff $id'),
    ]..sort((a, b) => a.$2.toLowerCase().compareTo(b.$2.toLowerCase()));
    _draft = {
      for (final (id, _) in _workers)
        id: state.qualifiesForBonusById[id] ?? false,
    };
  }

  void _save() {
    final bloc = context.read<PreparePayrollBloc>();
    bloc.add(
      PreparePayrollEvent.bonusEligibilityChanged({
        ...bloc.state.qualifiesForBonusById,
        ..._draft,
      }),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Bonus Eligibility'),
      content: SizedBox(
        width: 420,
        height: MediaQuery.sizeOf(context).height * 0.6,
        child: _workers.isEmpty
            ? const Center(child: Text('No workers with shifts this period.'))
            : ListView(
                children: [
                  for (final (id, name) in _workers)
                    CheckboxListTile(
                      value: _draft[id] ?? false,
                      title: Text(name),
                      subtitle: Text('Worker ID $id'),
                      onChanged: (value) =>
                          setState(() => _draft[id] = value ?? false),
                    ),
                ],
              ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _workers.isEmpty ? null : _save,
          child: const Text('Save'),
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

/// Inline banner shown when the live report recompute fails, so the inputs
/// stay on screen for the user to correct rather than being replaced by a
/// full-page error.
class _ReportErrorBanner extends StatelessWidget {
  const _ReportErrorBanner({required this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: theme.colorScheme.onErrorContainer),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message ?? 'Unable to build the report.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onErrorContainer,
              ),
            ),
          ),
        ],
      ),
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
        final sortedRows = [...workerRows!]
          ..sort(
            (a, b) => a.worker.toLowerCase().compareTo(b.worker.toLowerCase()),
          );
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
                minWidth: 1000,
                fixedTopRows: 1,
                fixedLeftColumns: 1,
                headingRowHeight: 72,
                columns: const [
                  // DataColumn2(label: _HeaderLabel('#'), fixedWidth: 8),
                  DataColumn2(label: _HeaderLabel('Worker')),
                  // DataColumn2(label: _HeaderLabel('Dates'), size: ColumnSize.L),
                  DataColumn2(
                    label: _HeaderLabel('Hours'),
                    numeric: true,
                    tooltip: 'Clocked in time, paid in full',
                  ),
                  DataColumn2(label: _HeaderLabel('Pay rate'), numeric: true),
                  DataColumn2(
                    label: _HeaderLabel('Mileage'),
                    numeric: true,
                    tooltip: 'Miles driven this period',
                  ),
                  DataColumn2(
                    label: _HeaderLabel('Pay'),
                    numeric: true,
                    tooltip: '(hours * pay rate) + '
                        '(mileage * mileage constant). '
                        'Bonus pay not included.',
                  ),
                  DataColumn2(
                    label: _HeaderLabel('NTT'),
                    numeric: true,
                    tooltip: 'Non-task time. Paid as hours; its cost '
                        '(NTT * pay rate) comes off the bonus instead.',
                  ),
                  DataColumn2(
                    label: _HeaderLabel('Bonus pay'),
                    numeric: true,
                    tooltip: 'Pot share (if eligible) - (NTT * pay rate), '
                        'floored at \$0.',
                  ),
                ],
                rows: [
                  for (final (i, r) in sortedRows.indexed)
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
                                '${r.periodHours.toStringAsFixed(2)} clocked '
                                'in, of which '
                                '${r.netHours.toStringAsFixed(2)} on task',
                            child: Text(r.periodHours.toStringAsFixed(2)),
                          ),
                        ),
                        DataCell(Text(_money(r.payRate))),
                        DataCell(
                          Tooltip(
                            message:
                                '${r.mileageForPeriod.toStringAsFixed(0)} mi × '
                                '${_money(state.mileageConstant ?? 0)} = '
                                '${_money(r.mileagePay)}',
                            child: Text(r.mileageForPeriod.toStringAsFixed(0)),
                          ),
                        ),
                        DataCell(
                          Tooltip(
                            message:
                                '${_money(r.periodHourlyPay)} hourly '
                                '(${r.periodHours.toStringAsFixed(2)} hrs × '
                                '${_money(r.payRate)})\n'
                                '+ ${_money(r.mileagePay)} mileage '
                                '(${r.mileageForPeriod.toStringAsFixed(0)} '
                                'mi × ${_money(state.mileageConstant ?? 0)})\n'
                                '= ${_money(r.totalPeriodPay)}',
                            child: Text(_money(r.totalPeriodPay)),
                          ),
                        ),
                        DataCell(
                          Tooltip(
                            message: r.periodNtt == 0
                                ? 'No non-task time this period'
                                : '${r.periodNtt.toStringAsFixed(2)} hrs × '
                                    '${_money(r.payRate)} = '
                                    '${_money(r.nttCost)} off the bonus. '
                                    'Click the worker for the per-day '
                                    'breakdown.',
                            child: Text(r.periodNtt.toStringAsFixed(2)),
                          ),
                        ),
                        DataCell(
                          TextButton(
                            onPressed: () => _showBonusDialog(
                              context,
                              row: r,
                              state: state,
                              pot: bonusPot,
                              totalCleans: totalCleans,
                            ),
                            child: Text(
                              _money(
                                r.bonusPay(
                                  pot: bonusPot,
                                  totalCleans: totalCleans,
                                ),
                              ),
                            ),
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
    final revenueShare = PreparePayrollState.bonusRevenueRate * revenue;
    final heath = state.heathDeductions ?? 0;
    final qualifies = row.qualifiesForBonus;
    final share = (!qualifies || totalCleans <= 0)
        ? 0.0
        : row.cleans / totalCleans;
    final grossShare = pot * share;
    final bonus = row.bonusPay(pot: pot, totalCleans: totalCleans);
    // The bonus floors at 0, so say so when non-task time has eaten it all.
    final isFloored = qualifies && grossShare - row.nttCost < 0;

    String pct(double v) => '${(v * 100).toStringAsFixed(2)}%';

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
              _bonusLine(
                '× ${pct(PreparePayrollState.bonusRevenueRate)}',
                _money(revenueShare),
              ),
              _bonusLine('− Heath deductions', '−${_money(heath)}'),
              const Divider(),
              _bonusLine('Total pot', _money(pot), bold: true),
              const SizedBox(height: 12),
              if (!qualifies)
                _bonusLine('Not eligible for bonus', 'earns \$0'),
              _bonusLine("This worker's qualifying cleans", '${row.cleans}'),
              if (row.overTimeCleans > 0)
                _bonusLine(
                  'Over-time cleans (excluded)',
                  '${row.overTimeCleans}',
                ),
              _bonusLine('Total cleans', '$totalCleans'),
              _bonusLine('Share of pot', pct(share)),
              const Divider(),
              _bonusLine('Pot × share', _money(grossShare)),
              _bonusLine(
                '− Non-task time (${row.periodNtt.toStringAsFixed(2)} hrs × '
                '${_money(row.payRate)})',
                '−${_money(row.nttCost)}',
              ),
              _bonusLine('− Callback deductions', '−${_money(0)}'),
              if (isFloored) _bonusLine('Floored at', _money(0)),
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
                              Theme.of(context).colorScheme.errorContainer
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

  String _longDate(DateTime d) => '${_monthName(d.month)} ${d.day}, ${d.year}';

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
      message: 'Not in schedule: ${row.inadvertentProperties.join(', ')}',
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

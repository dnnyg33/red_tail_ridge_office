import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:red_tail_ridge_office/payroll/bloc/prepare_payroll_bloc.dart';

const _sampleCsv = '''SEP=,
,Date/Days,MileageIn,MileageOut,MileageTotal,ClockIn,ClockOut,TimeZone,Total Time (hh:mm),Total Time Hours,Average per Day (hh:mm), Average per Day Hours,Pay Rate,Pay,Note
TOTALS,2 Days,,,10,,,,5:00,5.00,2:30,2.50
"Alice",2 Days,,,10,,,,4:00,4.00,2:00,2.00,20.00,80.00,""
,2026/05/01,,,5,9:00AM,11:00AM,PDT,2:00,2.00,,,20.00,40.00,""
,2026/05/03,,,5,9:00AM,11:00AM,PDT,2:00,2.00,,,20.00,40.00,""
''';

Uint8List _bytes(String s) => Uint8List.fromList(utf8.encode(s));

void main() {
  group('PreparePayrollBloc', () {
    test('initial state defaults', () {
      final state = PreparePayrollBloc().state;
      expect(state.status, PreparePayrollStatus.initial);
      expect(state.workerRows, isEmpty);
      expect(state.mileageConstant, 0.725);
      expect(state.timeTrackingFileName, isNull);
      expect(state.timeTrackingBytes, isNull);
    });

    blocTest<PreparePayrollBloc, PreparePayrollState>(
      'PreparePayrollStarted -> status ready with a pay period',
      build: PreparePayrollBloc.new,
      act: (bloc) => bloc.add(const PreparePayrollEvent.started()),
      verify: (bloc) {
        expect(bloc.state.status, PreparePayrollStatus.ready);
        expect(bloc.state.payPeriodStart, isNotNull);
        expect(bloc.state.payPeriodEnd, isNotNull);
      },
    );

    blocTest<PreparePayrollBloc, PreparePayrollState>(
      'TimeTrackingFileSelected stores file metadata and bytes',
      build: PreparePayrollBloc.new,
      act: (bloc) => bloc.add(
        PreparePayrollTimeTrackingFileSelected(
          fileName: 'sample.csv',
          filePath: '/tmp/sample.csv',
          bytes: _bytes('foo'),
        ),
      ),
      verify: (bloc) {
        expect(bloc.state.timeTrackingFileName, 'sample.csv');
        expect(bloc.state.timeTrackingFilePath, '/tmp/sample.csv');
        expect(bloc.state.timeTrackingBytes, isNotNull);
      },
    );

    blocTest<PreparePayrollBloc, PreparePayrollState>(
      'MileageConstantChanged with a value sets mileageConstant',
      build: PreparePayrollBloc.new,
      act: (bloc) =>
          bloc.add(const PreparePayrollEvent.mileageConstantChanged(5.0)),
      verify: (bloc) => expect(bloc.state.mileageConstant, 5.0),
    );

    blocTest<PreparePayrollBloc, PreparePayrollState>(
      'MileageConstantChanged with null clears mileageConstant',
      build: PreparePayrollBloc.new,
      seed: () => const PreparePayrollState(mileageConstant: 5.0),
      act: (bloc) =>
          bloc.add(const PreparePayrollEvent.mileageConstantChanged(null)),
      verify: (bloc) => expect(bloc.state.mileageConstant, isNull),
    );

    blocTest<PreparePayrollBloc, PreparePayrollState>(
      'ReportRequested without bytes -> failure with error message',
      build: PreparePayrollBloc.new,
      act: (bloc) => bloc.add(const PreparePayrollEvent.reportRequested()),
      verify: (bloc) {
        expect(bloc.state.status, PreparePayrollStatus.failure);
        expect(bloc.state.errorMessage, contains('No time tracking file'));
      },
    );

    blocTest<PreparePayrollBloc, PreparePayrollState>(
      'ReportRequested parses CSV and emits worker rows + overall range',
      build: PreparePayrollBloc.new,
      seed: () => PreparePayrollState(
        status: PreparePayrollStatus.ready,
        timeTrackingFileName: 'sample.csv',
        timeTrackingBytes: _bytes(_sampleCsv),
        mileageConstant: 0.5,
      ),
      act: (bloc) => bloc.add(const PreparePayrollEvent.reportRequested()),
      verify: (bloc) {
        expect(bloc.state.status, PreparePayrollStatus.ready);
        expect(bloc.state.workerRows, hasLength(1));
        final alice = bloc.state.workerRows.single;
        expect(alice.worker, 'Alice');
        expect(alice.periodHourlyPay, 80.0);
        expect(alice.mileagePay, 5.0);
        expect(alice.totalPeriodPay, 85.0);
        expect(bloc.state.payPeriodStart, DateTime(2026, 5, 1));
        expect(bloc.state.payPeriodEnd, DateTime(2026, 5, 3));
      },
    );
  });
}
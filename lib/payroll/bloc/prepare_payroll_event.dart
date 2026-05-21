part of 'prepare_payroll_bloc.dart';

sealed class PreparePayrollEvent extends Equatable {
  const PreparePayrollEvent();

  @override
  List<Object?> get props => [];
}

final class PreparePayrollStarted extends PreparePayrollEvent {
  const PreparePayrollStarted();
}

final class PreparePayrollTimeTrackingFileSelected extends PreparePayrollEvent {
  const PreparePayrollTimeTrackingFileSelected({
    required this.fileName,
    required this.filePath,
    this.bytes,
  });

  final String fileName;
  final String? filePath;
  final Uint8List? bytes;

  @override
  List<Object?> get props => [fileName, filePath, bytes];
}

final class PreparePayrollMileageConstantChanged extends PreparePayrollEvent {
  const PreparePayrollMileageConstantChanged(this.value);

  final double? value;

  @override
  List<Object?> get props => [value];
}

final class PreparePayrollReportRequested extends PreparePayrollEvent {
  const PreparePayrollReportRequested();
}
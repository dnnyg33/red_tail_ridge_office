import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

/// Desktop/mobile implementation: ask for a destination path, then write
/// [bytes] there ourselves. Returns the saved path, or null if cancelled.
Future<String?> savePayRateFile({
  required String fileName,
  required Uint8List bytes,
}) async {
  final path = await FilePicker.platform.saveFile(
    dialogTitle: 'Save pay rate file',
    fileName: fileName,
    type: FileType.custom,
    allowedExtensions: const ['json'],
  );
  if (path == null) return null;
  final withExt = path.toLowerCase().endsWith('.json') ? path : '$path.json';
  await File(withExt).writeAsBytes(bytes, flush: true);
  return withExt;
}

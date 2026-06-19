import 'dart:js_interop';
import 'dart:typed_data';

import 'package:web/web.dart' as web;

/// Web implementation: build an in-memory blob and trigger a browser download
/// via a transient anchor element. `file_picker`'s `saveFile` is unimplemented
/// on web, so we do the download ourselves. Returns the file name (web offers
/// no cancel signal).
Future<String?> savePayRateFile({
  required String fileName,
  required Uint8List bytes,
}) async {
  final blob = web.Blob(
    [bytes.toJS].toJS,
    web.BlobPropertyBag(type: 'application/json'),
  );
  final url = web.URL.createObjectURL(blob);
  final anchor = web.HTMLAnchorElement()
    ..href = url
    ..download = fileName;
  anchor.click();
  web.URL.revokeObjectURL(url);
  return fileName;
}

/// Cross-platform "save as" for the generated pay-rate JSON file.
///
/// macOS' [FilePicker.saveFile] throws if given `bytes` (it returns the chosen
/// path for the caller to write), and on web `saveFile` is unimplemented — so
/// the web variant downloads via `package:web` instead. The implementation is
/// selected at compile time: the `dart:io` variant for native, the web variant
/// when `dart:js_interop` is available (covers both JS and wasm web targets).
export 'pay_rate_file_saver_io.dart'
    if (dart.library.js_interop) 'pay_rate_file_saver_web.dart';

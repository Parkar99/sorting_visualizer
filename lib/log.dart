import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final _log = Logger(output: _Output());

void logi(dynamic message, {StackTrace? stackTrace}) {
  if (!kDebugMode) return;
  _log.i(message.toString(), null, stackTrace ?? StackTrace.current);
}

void logd(dynamic message, {StackTrace? stackTrace}) {
  if (!kDebugMode) return;
  _log.d(message.toString(), null, stackTrace);
}

void loge(dynamic message, {Object? error, StackTrace? stackTrace}) {
  if (!kDebugMode) return;
  _log.e(message.toString(), error, stackTrace ?? StackTrace.current);
}

class _Output extends LogOutput {
  _Output();

  @override
  void output(OutputEvent event) {
    for (final line in event.lines) {
      debugPrint(line, wrapWidth: 110);
    }
  }
}

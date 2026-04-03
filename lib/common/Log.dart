import 'package:easy_localization/easy_localization.dart';

class Log {
  static bool enabled = true;

  static void i(String tag, String message) {
    if (enabled) {
      log('ℹ️${tag}', message); }
  }

  static void e(String tag, String message) {
    if (enabled) {
      log('❌${tag}', message); }
  }

  static void d(String tag, String message) {
    if (enabled) {
      log('🐞${tag}', message); }
  }

  static void log(String level, String message) {
    final now = DateTime.now();
    final formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(now);
    final trace = StackTrace.current;
    final fileInfo = extractCallerInfo(trace);
    final logMessage = '[$formattedTime][$level] ($fileInfo) $message';
    print(logMessage);
  }

  static String extractCallerInfo(StackTrace trace) {
    final traceString = trace.toString();
    final traceLines = traceString.split('\n');
    for (final line in traceLines) {
      if (line.contains('Log._log') || line.contains('Log.i') || line.contains('Log.e') || line.contains('Log.d')) {
        continue;
      }
      final match = RegExp(r'(\w+\.dart):(\d+):\d+').firstMatch(line);
      if (match != null) {
        final file = match.group(1);
        final lineNumber = match.group(2);
        return '$file:$lineNumber';
      }
    }

    return 'unknown';
  }
}
import 'package:flutter/foundation.dart';

enum LogLevel { info, debug, warning, error }

/// LoggerConfig class to store logging configuration.
class _LoggerConfig {
  static String? appName;
}

/// Set the app name to be used in the logs.
void setAppTag(String appName) {
  _LoggerConfig.appName = appName;
}

/// Print a debug message to the console with the format as follows, `[LogLevel] [timestamp] [primary tag] [additionally provided tags] message`.
/// e.g. D 2021-09-29T14:00:00.000 [appName] [...tags] message
///
/// The [toString()] function is called on the [message] object to convert to a string.
/// If `debugOverride` is set to `false`, the message will not be printed.
void printDebug(dynamic message,
    {String? tag, bool timestamp = true, bool debugOverride = kDebugMode}) {
  if (debugOverride) {
    _print(message.toString(),
        tag: tag, logLevel: LogLevel.debug, timestamp: timestamp);
  }
}

/// Print an info message to the console with the format as follows, `[LogLevel] [timestamp] [primary tag] [additionally provided tags] message`.
/// e.g. I 2021-09-29T14:00:00.000 [appName] [...tags] message
///
/// The [toString()] function is called on the [message] object to convert to a string.
/// If `debugOverride` is set to `false`, the message will not be printed.
void printInfo(dynamic message,
    {String? tag, bool timestamp = true, bool debugOverride = kDebugMode}) {
  if (debugOverride) {
    _print(message.toString(),
        tag: tag, logLevel: LogLevel.info, timestamp: timestamp);
  }
}

/// Print a warning message to the console with the format as follows, `[LogLevel] [timestamp] [primary tag] [additionally provided tags] message`.
/// e.g. W 2021-09-29T14:00:00.000 [appName] [...tags] message
///
/// The [toString()] function is called on the [message] object to convert to a string.
/// If `debugOverride` is set to `false`, the message will not be printed.
void printWarning(dynamic message,
    {String? tag, bool timestamp = true, bool debugOverride = kDebugMode}) {
  if (debugOverride) {
    _print(message.toString(),
        tag: tag, logLevel: LogLevel.warning, timestamp: timestamp);
  }
}

/// Print an error message to the console with the format as follows, `[LogLevel] [timestamp] [primary tag] [additionally provided tags] message`.
/// e.g. E 2021-09-29T14:00:00.000 [appName] [...tags] message
///
/// The [toString()] function is called on the [message] object to convert to a string.
/// If `debugOverride` is set to `false`, the message will not be printed.
void printError(dynamic message,
    {String? tag, bool timestamp = true, bool debugOverride = kDebugMode}) {
  if (debugOverride) {
    _print(message.toString(),
        tag: tag, logLevel: LogLevel.error, timestamp: timestamp);
  }
}

/// Print a message to the console with the format as follows, `[LogLevel] [timestamp] [primary tag] [additionally provided tags] message`.
void _print(String message,
    {LogLevel logLevel = LogLevel.debug, String? tag, bool timestamp = true}) {
  // example of formatted log: W 2021-09-29T14:00:00.000 [web_callkit] ...[tags] message
  final type = logLevel.name[0].toUpperCase();
  final appTag = _LoggerConfig.appName;
  final tags = [appTag, tag]
      .where((element) => element != null)
      .map((e) => "[$e]")
      .join(" ");
  String time = "";
  if (timestamp) {
    time = DateTime.now().toIso8601String();
  }
  final prefix = "$type $time $tags".replaceAll('w+', ' ').trim();
  final formatted = "$prefix $message";
  // ignore: avoid_print
  print(formatted);
}

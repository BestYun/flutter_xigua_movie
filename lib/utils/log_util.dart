import 'package:logging/logging.dart';
import 'dart:developer' as developer;

class LogUtil {
  static log(dynamic info) {
    logging.info(info);
  }
}

final logging = Logger('西瓜电影');
void initLogging() {
  // disable hierarchical logger
  hierarchicalLoggingEnabled = false;
  // change to another level as needed.
  Logger.root.level = Level.ALL;
  // skip logging stactrace below the SEVERE level.
  recordStackTraceAtLevel = Level.SEVERE;
  assert(() {
    recordStackTraceAtLevel = Level.WARNING;
    // print all logs on debug build.
    Logger.root.level = Level.ALL;
    return true;
  }());

  ///监听log并且打印
  Logger.root.onRecord.listen((event) {
    developer.log(
      event.message,
      time: event.time,
      sequenceNumber: event.sequenceNumber,
      level: event.level.value,
      name: event.loggerName,
      zone: event.zone,
      error: event.error,
      stackTrace: event.stackTrace,
    );
  });
}

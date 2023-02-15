import 'dart:convert';

import 'package:logger/logger.dart';

class LoggerUtil {
  String name;
  LoggerUtil(this.name);

  info(dynamic message) {
    final prettyLogger = Logger(
      printer: PrettyPrinter(
        printEmojis: false,
      ),
    );
    try {
      message = jsonDecode(message);
    } catch (e) {
      //
    }
    prettyLogger.log(Level.info, {
      "source": name,
      "detail": message,
    });
  }
}

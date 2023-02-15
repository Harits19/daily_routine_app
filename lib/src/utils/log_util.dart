import 'dart:convert';

import 'package:logger/logger.dart';

class LogUtil {
  String name;
  LogUtil(this.name);

  info(dynamic message, {String? name}) {
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
      "source": name ?? this.name,
      "detail": message,
    });
  }
}

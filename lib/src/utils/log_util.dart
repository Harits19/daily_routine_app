import 'dart:convert';

import 'package:logger/logger.dart';

class LogUtil {
  String name;
  LogUtil(this.name);

  info(dynamic message, {String? key}) {
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
      "key": key,
      "detail": message,
    });
  }
}

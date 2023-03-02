import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

extension ObjectExtension on Object {
  myPrint(dynamic message, {String? key}) {
    if (kReleaseMode) return;
    final name = runtimeType.toString();
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
    prettyLogger.log(
      Level.info,
      {
        "source": name,
        "key": key,
        "detail": message,
      },
    );
    print(
      'source : $name \nkey : $key \nmessage : $message',
    );
  }
}

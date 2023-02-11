import 'package:logging/logging.dart';

myLog(Object? message) {
  final log = Logger('default');
  log.info(message);
}

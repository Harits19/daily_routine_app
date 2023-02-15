import 'package:daily_routine_app/src/utils/logger_util.dart';

final log = LoggerUtil("StringExtension");

extension StringExtension on String {
  String get toCapitalize {
    final splitString = split(" ");
    final newString = <String>[];
    for (final string in splitString) {
      final capitalizedString =
          string[0].toUpperCase() + string.substring(1, string.length);
      newString.add(capitalizedString);
    }
    log.info(newString);
    return newString.join(" ");
  }
}

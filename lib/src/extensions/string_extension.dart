import 'package:daily_routine_app/src/extensions/object_extension.dart';

extension StringExtension on String {
  String get toCapitalize {
    final splitString = split(" ");
    final newString = <String>[];
    for (final string in splitString) {
      final capitalizedString =
          string[0].toUpperCase() + string.substring(1, string.length);
      newString.add(capitalizedString);
    }
    myPrint(newString);
    return newString.join(" ");
  }

  String get threeLetter {
    return substring(0, 3);
  }
}

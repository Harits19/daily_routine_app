import 'package:daily_routine_app/src/enums/weekend.dart';

extension WeekendExtension on Weekend {
  String get formattedName {
    return name[0].toUpperCase() + name.substring(1, name.length);
  }

}
import 'package:daily_routine_app/src/enums/weekend.dart';

class KDate {
  static List<String> get listOfMonths => [
        "dummy",
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec"
      ];

  static List<String> get listOfDays =>
      ['dummy', ...Weekend.values.map((e) => e.formattedName)];
}

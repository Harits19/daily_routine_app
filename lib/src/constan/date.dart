import 'package:daily_routine_app/src/models/daily_task_model.dart';

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
      ['dummy', ...Weekend.values.map((e) => e.text)];
}

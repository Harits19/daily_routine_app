import 'package:daily_routine_app/src/enums/weekend.dart';

extension IntExtension on int {
  Weekend get toWeekend {
    const listWeekend = Weekend.values;
    return listWeekend[this - 1];
  }
}

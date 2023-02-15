import 'package:daily_routine_app/src/extensions/string_extension.dart';

enum TaskType {
  single,
  recurring;

  @override
  String toString() {
    print('called');
    return name.toCapitalize;
  }
}

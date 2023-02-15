import 'package:daily_routine_app/src/extensions/date_time_extension.dart';

class CheckedTaskModel {
  final DateTime date;
  final String idTask;

  CheckedTaskModel({
    required this.date,
    required this.idTask,
  });

  CheckedTaskModel.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse(json['date']),
        idTask = json['id_task'];

  Map<String, dynamic> toJson() => {
        "id_task": idTask,
        'date': date.toString(),
      };

  bool isSameWith(CheckedTaskModel other) {
    print(
        "isSameWith : $idTask ${other.idTask} $date ${other.date} ${date.isSameDate(other.date)}");
    return idTask == other.idTask && date.isSameDate(other.date);
  }
}

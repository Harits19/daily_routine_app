import 'package:daily_routine_app/src/models/task_model.dart';

class DailyTaskModel {
  final Weekend weekend;
  final List<TaskModel> tasks;
  // final DateTime dateTime;

  DailyTaskModel({
    required this.tasks,
    required this.weekend,
    // required this.dateTime,
  });

  DailyTaskModel.fromJson(Map<String, dynamic> json)
      : weekend = json["weekend"],
        // dateTime = DateTime.parse(json['date_time']),
        tasks =
            (json['tasks'] as List).map((e) => TaskModel.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
        // 'date_time': dateTime.toString(),
        "weekend": weekend,
        'tasks': tasks.map((e) => e.toJson()),
      };
}

enum Weekend {
  monday(text: "Monday"),
  tuesday(text: "Tuesday"),
  wednesday(text: "Wednesday"),
  thursday(text: "Thursday"),
  friday(text: "Friday"),
  saturday(text: "Saturday"),
  sunday(text: "Sunday");

  const Weekend({required this.text});
  final String text;
}

import 'package:daily_routine_app/src/models/checked_task_model.dart';
import 'package:daily_routine_app/src/models/task_model.dart';

class DailyRoutineModel {
  final List<CheckedTaskModel> checkedTasks;
  final List<TaskModel> tasks;
  static const _checkedTasks = 'checked_tasks';
  static const _tasks = 'tasks';

  DailyRoutineModel({
    required this.checkedTasks,
    required this.tasks,
  });

  DailyRoutineModel.fromJson(Map<String, dynamic> json)
      : checkedTasks = (json[_checkedTasks] as List)
            .map((e) => CheckedTaskModel.fromJson(e))
            .toList(),
        tasks = (json[_tasks] as List)
            .map((e) => TaskModel.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() => {
        _checkedTasks: checkedTasks.map((e) => e.toJson()).toList(),
        _tasks: tasks.map((e) => e.toJson()).toList(),
      };
}


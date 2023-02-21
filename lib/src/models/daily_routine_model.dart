import 'package:daily_routine_app/src/models/checked_task_model.dart';
import 'package:daily_routine_app/src/models/task_model.dart';

class DailyRoutineModel {
  final List<CheckedTaskModel> checkedTasks;
  final List<TaskModel> tasks;
  static const _keyCheckedTasks = 'checked_tasks';
  static const _keyTasks = 'tasks';

  DailyRoutineModel({
    required this.checkedTasks,
    required this.tasks,
  });

  DailyRoutineModel.fromJson(Map<String, dynamic> json)
      : checkedTasks = (json[_keyCheckedTasks] as List)
            .map((e) => CheckedTaskModel.fromJson(e))
            .toList(),
        tasks = (json[_keyTasks] as List)
            .map((e) => TaskModel.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() => {
        _keyCheckedTasks: checkedTasks.map((e) => e.toJson()).toList(),
        _keyTasks: tasks.map((e) => e.toJson()).toList(),
      };
}


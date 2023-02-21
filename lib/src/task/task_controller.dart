import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:daily_routine_app/src/services/pref_task_service.dart';
import 'package:flutter/material.dart';

class TaskController with ChangeNotifier {
  var data = <TaskModel>[];

  Future<void> addTask(TaskModel task) {
    return PrefTaskService.addTask(task).then((value) {
      getTask();
    });
  }

  void getTask() {
    data = PrefTaskService.getTask();
    notifyListeners();
  }

  Future<void> deleteTask(String id) {
    final task = data.firstWhere(
      (element) => element.id == id,
    );
    return updateTask(task.copyWith(
      isDeleted: true,
    )).then((value) {
      getTask();
    });
  }

  Future<void> updateTask(TaskModel task) {
    return PrefTaskService.updateTask(task).then((value) {
      getTask();
    });
  }

  Future<void> addTasks(List<TaskModel> tasks) {
    return PrefTaskService.addTasks(tasks).then((value) {
      getTask();
    });
  }
}

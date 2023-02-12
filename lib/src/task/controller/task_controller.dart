import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:daily_routine_app/src/services/preference_service.dart';
import 'package:flutter/material.dart';

class TaskController with ChangeNotifier {
  var data = <TaskModel>[];

  Future<void> addTask(TaskModel task) {
    return PreferenceService.addTask(task).then((value) {
      getTask();
    });
  }

  void getTask() {
    data = PreferenceService.getTask();
    notifyListeners();
  }

  Future<void> deleteTask(String id) {
    return PreferenceService.deleteTask(id).then((value) {
      getTask();
    });
  }

  Future<void> updateTask(TaskModel task) {
    return PreferenceService.updateTask(task).then((value) {
      getTask();
    });
  }
}

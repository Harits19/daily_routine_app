import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:daily_routine_app/src/services/preference_service.dart';
import 'package:flutter/material.dart';

class TaskController with ChangeNotifier {
  var data = <TaskModel>[];

  void addTask(TaskModel task) {
    PreferenceService.addTask(task).then((value) {
      getTask();
    });
  }

  void getTask() {
    data = PreferenceService.getTask();
    notifyListeners();
  }
}

import 'dart:convert';

import 'package:daily_routine_app/src/enums/shared_pref_key.dart';
import 'package:daily_routine_app/src/extensions/shared_prefs_extension.dart';
import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:daily_routine_app/src/services/service_instance.dart';
import 'package:daily_routine_app/src/utils/log_util.dart';

class PrefTaskService {
  Future<void> addTask(TaskModel task) async {
    final data = getTask();
    data.add(task);
    await addTasks(data);
  }

  List<TaskModel> getTask() {
    final json = ServiceInstance.prefs.getStringV2(SharedPrefKey.task);
    if (json == null) {
      return [];
    }
    myPrint(json);
    return (jsonDecode(json) as List)
        .map((e) => TaskModel.fromJson(e))
        .toList();
  }

  Future<void> addTasks(List<TaskModel> tasks) async {
    final dataJson = tasks.map((e) => e.toJson()).toList();
    final dataString = jsonEncode(dataJson);
    await ServiceInstance.prefs.setStringV2(SharedPrefKey.task, dataString);
  }

  Future<void> updateTask(TaskModel task) {
    final data = getTask();
    final index = data.indexWhere((element) {
      myPrint('element id : ${element.id}, task id : ${task.id}');
      return element.id == task.id;
    });
    myPrint(index);
    data[index] = task;
    return addTasks(data);
  }
}

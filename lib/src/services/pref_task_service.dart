import 'dart:convert';

import 'package:daily_routine_app/src/enums/shared_pref_key.dart';
import 'package:daily_routine_app/src/extensions/shared_prefs_extension.dart';
import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:daily_routine_app/src/services/service_instance.dart';
import 'package:daily_routine_app/src/utils/log_util.dart';

class PrefTaskService {
  static const name = "PrefTaskService";
  static final log = LogUtil(name);

  static Future<void> addTask(TaskModel task) async {
    final data = getTask();
    data.add(task);
    await addTasks(data);
  }

  static List<TaskModel> getTask() {
    final json = ServiceInstance.prefs.getStringV2(SharedPrefKey.task);
    if (json == null) {
      return [];
    }
    return (jsonDecode(json) as List)
        .map((e) => TaskModel.fromJson(e))
        .toList();
  }

  static Future<void> addTasks(List<TaskModel> tasks) async {
    final dataJson = tasks.map((e) => e.toJson()).toList();
    final dataString = jsonEncode(dataJson);
    await ServiceInstance.prefs.setStringV2(SharedPrefKey.task, dataString);
  }

  static Future<void> updateTask(TaskModel task) {
    final data = getTask();
    final index = data.indexWhere((element) {
      log.info('element id : ${element.id}, task id : ${task.id}');
      return element.id == task.id;
    });
    log.info(index);
    data[index] = task;
    return addTasks(data);
  }
}

import 'dart:convert';

import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:daily_routine_app/src/services/service_instance.dart';
import 'package:daily_routine_app/src/utils/logger_util.dart';

class PreferenceService {
  static const name = "PreferenceService";
  static const _keyTask = "keyTask";
  static final log = LoggerUtil(name);

  static Future<void> addTask(TaskModel task) async {
    final data = getTask();
    data.add(task);
    final dataJson = data.map((e) => e.toJson()).toList();
    final dataString = jsonEncode(dataJson);
    log.info(dataString);

    await ServiceInstance.prefs.setString(_keyTask, dataString);
  }

  static List<TaskModel> getTask() {
    final json = ServiceInstance.prefs.getString(_keyTask);
    if (json == null) {
      return [];
    }
    log.info(json);
    return (jsonDecode(json) as List)
        .map((e) => TaskModel.fromJson(e))
        .toList();
  }
}

import 'dart:convert';

import 'package:daily_routine_app/src/enums/shared_pref_key.dart';
import 'package:daily_routine_app/src/extensions/shared_prefs_extension.dart';
import 'package:daily_routine_app/src/models/checked_task_model.dart';
import 'package:daily_routine_app/src/services/service_instance.dart';
import 'package:daily_routine_app/src/utils/log_util.dart';

class PrefCheckedTaskService {
  static const name = "PrefCheckedTaskService";
  static final log = LogUtil(name);

  static Future<void> addCheckedTask(CheckedTaskModel checkedTask) async {
    final data = getListCheckedTask();
    data.add(checkedTask);
    await addListCheckedTask(data);
  }

  static List<CheckedTaskModel> getListCheckedTask() {
    final json = ServiceInstance.prefs.getStringV2(SharedPrefKey.checkedTask);
    if (json == null) {
      return [];
    }
    return (jsonDecode(json) as List)
        .map((e) => CheckedTaskModel.fromJson(e))
        .toList();
  }

  static Future<void> deleteCheckedTask(CheckedTaskModel checkedTask) async {
    final data = getListCheckedTask();
    data.removeWhere((element) => element.isSameWith(checkedTask));
    await addListCheckedTask(data);
  }

  static Future<void> addListCheckedTask(
      List<CheckedTaskModel> listCheckedTask) async {
    final dataJson = listCheckedTask.map((e) => e.toJson()).toList();
    final dataString = jsonEncode(dataJson);
    log.info(dataString);
    await ServiceInstance.prefs.setStringV2(SharedPrefKey.checkedTask, dataString);
  }
}

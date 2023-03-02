import 'dart:convert';

import 'package:daily_routine_app/src/enums/shared_pref_key.dart';
import 'package:daily_routine_app/src/extensions/shared_prefs_extension.dart';
import 'package:daily_routine_app/src/models/checked_task_model.dart';
import 'package:daily_routine_app/src/services/service_instance.dart';
import 'package:daily_routine_app/src/extensions/object_extension.dart';

class PrefCheckedTaskService {
  Future<void> addCheckedTask(CheckedTaskModel checkedTask) async {
    final data = getListCheckedTask();
    data.add(checkedTask);
    await addListCheckedTask(data);
  }

  List<CheckedTaskModel> getListCheckedTask() {
    final json = ServiceInstance().prefs.getStringV2(SharedPrefKey.checkedTask);
    if (json == null) {
      return [];
    }
    return (jsonDecode(json) as List)
        .map((e) => CheckedTaskModel.fromJson(e))
        .toList();
  }

  Future<void> deleteCheckedTask(CheckedTaskModel checkedTask) async {
    final data = getListCheckedTask();
    data.removeWhere((element) => element.isSameWith(checkedTask));
    await addListCheckedTask(data);
  }

  Future<void> addListCheckedTask(
      List<CheckedTaskModel> listCheckedTask) async {
    final dataJson = listCheckedTask.map((e) => e.toJson()).toList();
    final dataString = jsonEncode(dataJson);
    myPrint(dataString);
    await ServiceInstance().prefs
        .setStringV2(SharedPrefKey.checkedTask, dataString);
  }
}

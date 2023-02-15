import 'package:daily_routine_app/src/models/checked_task_model.dart';
import 'package:daily_routine_app/src/services/pref_checked_task_service.dart';
import 'package:daily_routine_app/src/utils/log_util.dart';
import 'package:flutter/material.dart';

class CheckedTaskController with ChangeNotifier {
  final log = LogUtil("CheckedTaskController");
  var data = <CheckedTaskModel>[];

  Future<void> addCheckedTask(CheckedTaskModel task) {
    log.info(task);
    return PrefCheckedTaskService.addCheckedTask(task).then((value) {
      getListCheckedTask();
    });
  }

  void getListCheckedTask() {
    data = PrefCheckedTaskService.getListCheckedTask();
    notifyListeners();
  }

  Future<void> deleteCheckedTask(CheckedTaskModel checkedTask) {
    return PrefCheckedTaskService.deleteCheckedTask(checkedTask).then((value) {
      getListCheckedTask();
    });
  }
}

import 'package:daily_routine_app/src/models/checked_task_model.dart';
import 'package:daily_routine_app/src/models/daily_routine_model.dart';
import 'package:daily_routine_app/src/services/path_provider_service.dart';
import 'package:daily_routine_app/src/services/pref_checked_task_service.dart';
import 'package:daily_routine_app/src/task/task_controller.dart';
import 'package:daily_routine_app/src/utils/log_util.dart';
import 'package:flutter/material.dart';

class CheckedTaskController with ChangeNotifier {
  final log = LogUtil((CheckedTaskController).toString());
  var data = <CheckedTaskModel>[];
  TaskController? taskController;

  void update(TaskController taskController) {
    this.taskController = taskController;
  }

  Future<void> export() {
    return PathProviderService.export(
      DailyRoutineModel(
        checkedTasks: data,
        tasks: taskController?.data ?? [],
      ),
    );
  }

  Future<void> import() {
    return PathProviderService.import().then((value) async {
      if (value == null) return;
      addCheckedTasks(value.checkedTasks);
      taskController?.addTasks(value.tasks);
    });
  }

  Future<void> addCheckedTasks(List<CheckedTaskModel> checkedTasks) {
    return PrefCheckedTaskService.addListCheckedTask(checkedTasks)
        .then((value) {
      getListCheckedTask();
    });
  }

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

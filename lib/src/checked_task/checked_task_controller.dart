import 'package:daily_routine_app/src/models/checked_task_model.dart';
import 'package:daily_routine_app/src/models/daily_routine_model.dart';
import 'package:daily_routine_app/src/services/path_provider_service.dart';
import 'package:daily_routine_app/src/services/pref_checked_task_service.dart';
import 'package:daily_routine_app/src/task/task_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkedTaskProvider =
    StateNotifierProvider<CheckedTaskNotifier, CheckedTaskProvider>((ref) {
  return CheckedTaskNotifier(ref: ref)..getListCheckedTask();
});

class CheckedTaskNotifier extends StateNotifier<CheckedTaskProvider> {
  CheckedTaskNotifier({
    required this.ref,
  }) : super(CheckedTaskProvider());

  final Ref ref;

  Future<void> export() {
    return PathProviderService.export(
      DailyRoutineModel(
        checkedTasks: state.data,
        tasks: ref.watch(taskProvider).data,
      ),
    );
  }

  Future<void> import() {
    return PathProviderService.import().then((value) async {
      if (value == null) return;
      addCheckedTasks(value.checkedTasks);
      ref.read(taskProvider.notifier).addTasks(value.tasks);
    });
  }

  Future<void> addCheckedTasks(List<CheckedTaskModel> checkedTasks) {
    return PrefCheckedTaskService.addListCheckedTask(checkedTasks)
        .then((value) {
      getListCheckedTask();
    });
  }

  Future<void> addCheckedTask(CheckedTaskModel task) {
    return PrefCheckedTaskService.addCheckedTask(task).then((value) {
      getListCheckedTask();
    });
  }

  void getListCheckedTask() {
    state =
        CheckedTaskProvider(data: PrefCheckedTaskService.getListCheckedTask());
  }

  Future<void> deleteCheckedTask(CheckedTaskModel checkedTask) {
    return PrefCheckedTaskService.deleteCheckedTask(checkedTask).then((value) {
      getListCheckedTask();
    });
  }
}

class CheckedTaskProvider {
  final List<CheckedTaskModel> data;

  CheckedTaskProvider({this.data = const []});
}

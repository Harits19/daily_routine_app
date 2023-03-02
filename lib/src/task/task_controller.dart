import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:daily_routine_app/src/services/pref_task_service.dart';
import 'package:daily_routine_app/src/extensions/object_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskProvider>((ref) {
  return TaskNotifier()..getTask();
});

class TaskNotifier extends StateNotifier<TaskProvider> {
  TaskNotifier() : super(const TaskProvider());

  Future<void> addTask(TaskModel task) {
    return PrefTaskService().addTask(task).then((value) {
      getTask();
    });
  }

  void getTask() {
    state = TaskProvider(data: PrefTaskService().getTask());
  }

  Future<void> deleteTask(String id) {
    final task = state.data.firstWhere(
      (element) => element.id == id,
    );
    myPrint(task, key: 'delete');
    return updateTask(task.copyWith(
      isDeleted: true,
    )).then((value) {
      getTask();
    });
  }

  Future<void> updateTask(TaskModel task) {
    return PrefTaskService().updateTask(task).then((value) {
      getTask();
    });
  }

  Future<void> addTasks(List<TaskModel> tasks) {
    return PrefTaskService().addTasks(tasks).then((value) {
      getTask();
    });
  }
}

class TaskProvider {
  final List<TaskModel> data;

  const TaskProvider({this.data = const []});
}

import 'package:daily_routine_app/src/home/action_view.dart';
import 'package:daily_routine_app/src/home/add_task_view.dart';
import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:flutter/material.dart';

class UtilView {
  static Future<TaskModel?> showTaskAddUpdate(BuildContext context,
      {TaskModel? task}) {
    return showModalBottomSheet<TaskModel>(
        isScrollControlled: true,
        context: context,
        useSafeArea: true,
        builder: (context) {
          return AddTaskView(
            task: task,
          );
        });
  }

  static Future<void> showActionView(
    BuildContext context, {
    required List<ActionViewProps> actions,
  }) {
    return showModalBottomSheet(
        context: context,
        builder: ((context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...actions.map(
                (e) => ActionView(e: e),
              ),
            ],
          );
        }));
  }
}

import 'package:daily_routine_app/src/checked_task/checked_task_controller.dart';
import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:daily_routine_app/src/extensions/weekend_extension.dart';
import 'package:daily_routine_app/src/models/checked_task_model.dart';
import 'package:daily_routine_app/src/task/task_controller.dart';
import 'package:daily_routine_app/src/utils/log_util.dart';
import 'package:daily_routine_app/src/widgets/action_view.dart';
import 'package:daily_routine_app/src/widgets/add_update_task_view.dart';
import 'package:daily_routine_app/src/widgets/my_column.dart';
import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:daily_routine_app/src/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Consumer;
import 'package:provider/provider.dart';

class TaskView extends ConsumerStatefulWidget {
  const TaskView({
    super.key,
    required this.task,
    required this.checkable,
  });

  final TaskModel task;
  final bool checkable;

  @override
  ConsumerState<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends ConsumerState<TaskView> {
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      opacity = 1;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.task;
    final taskRead = ref.read(taskProvider.notifier);

    final checkedTaskRead = ref.read(checkedTaskProvider.notifier);
    final checkedTaskWatch = ref.watch(checkedTaskProvider);

    final idTask = task.id;
    final checkedTask = CheckedTaskModel(
      date: DateTime.now(),
      idTask: idTask,
    );
    var isChecked =
        checkedTaskWatch.data.any((element) => element.isSameWith(checkedTask));
    void checked() {
      if (isChecked) {
        checkedTaskRead.deleteCheckedTask(checkedTask);
        return;
      }
      checkedTaskRead.addCheckedTask(
        checkedTask,
      );
    }

    final checkable = widget.checkable;
    return TouchableOpacity(
      onTap: checkable
          ? () {
              checked();
            }
          : null,
      onLongPress: () {
        ActionView.show(
          context,
          actions: [
            ActionItem(
              text: "Delete",
              icon: Icons.delete,
              onPress: () {
                taskRead.deleteTask(task.id).then(
                      (value) => Navigator.pop(context),
                    );
              },
            ),
            ActionItem(
              text: "Edit",
              icon: Icons.edit,
              onPress: () {
                Navigator.pop(context);
                AddUpdateTaskView.show(context, task: task).then((value) {
                  if (value == null) return;
                  taskRead.updateTask(value);
                });
              },
            ),
          ],
        );
      },
      child: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 250),
        child: Card(
          margin: const EdgeInsets.symmetric(
            horizontal: KSize.s16,
            vertical: KSize.s8,
          ),
          child: Padding(
            padding: const EdgeInsets.all(KSize.s16),
            child: Row(
              children: [
                Expanded(
                  child: MyColumn(
                    spacing: KSize.s8,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        task.title,
                        style: TextStyle(
                          decoration:
                              isChecked ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      Text(
                        task.time.format(context),
                        style: const TextStyle(
                          fontSize: KSize.s12,
                          color: Colors.grey,
                        ),
                      ),
                      if (task.isRecurring)
                        Text(
                          task.listOfDays
                              .map((e) => e.formattedName)
                              .join(', '),
                          style: const TextStyle(
                            fontSize: KSize.s8,
                            color: Colors.blueGrey,
                          ),
                        ),
                    ],
                  ),
                ),
                if (checkable)
                  Checkbox(
                    value: isChecked,
                    onChanged: (val) {
                      if (val == null) return;
                      checked();
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

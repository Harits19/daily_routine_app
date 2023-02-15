import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:daily_routine_app/src/extensions/weekend_extension.dart';
import 'package:daily_routine_app/src/widgets/action_view.dart';
import 'package:daily_routine_app/src/widgets/my_column.dart';
import 'package:daily_routine_app/src/widgets/util_view.dart';
import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:daily_routine_app/src/task/task_controller.dart';
import 'package:daily_routine_app/src/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskView extends StatefulWidget {
  const TaskView({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
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
    final taskState = context.read<TaskController>();
    checked(bool? val) {
      taskState.updateTask(task.copyWith(checked: val));
    }

    final body = Card(
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
                insetsPadding: KSize.s8,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                      decoration:
                          task.checked ? TextDecoration.lineThrough : null,
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
                      task.listOfDays.map((e) => e.formattedName).join(', '),
                      style: const TextStyle(
                        fontSize: KSize.s8,
                        color: Colors.blueGrey,
                      ),
                    ),
                ],
              ),
            ),
            Checkbox(
              value: task.checked,
              onChanged: (val) {
                checked(val);
              },
            ),
          ],
        ),
      ),
    );

    return TouchableOpacity(
      onTap: () {
        checked(!task.checked);
      },
      onLongPress: () {
        UtilView.showActionView(
          context,
          actions: [
            ActionView(
              text: "Delete",
              icon: Icons.delete,
              onPress: () {
                if (task.id == null) return;
                taskState.deleteTask(task.id!).then(
                      (value) => Navigator.pop(context),
                    );
              },
            ),
            ActionView(
              text: "Edit",
              icon: Icons.edit,
              onPress: () {
                Navigator.pop(context);
                UtilView.showTaskAddUpdate(context, task: task).then((value) {
                  if (value == null) return;
                  taskState.updateTask(value);
                });
              },
            ),
          ],
        );
      },
      child: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 250),
        child: body,
      ),
    );
  }
}

import 'package:daily_routine_app/src/constan/size.dart';
import 'package:daily_routine_app/src/home/action_view.dart';
import 'package:daily_routine_app/src/home/util_view.dart';
import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:daily_routine_app/src/task/controller/task_controller.dart';
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

    final actions = [
      ActionViewProps(
        text: "Delete",
        icon: Icons.delete,
        onPress: () {
          if (task.id == null) return;
          taskState.deleteTask(task.id!).then(
                (value) => Navigator.pop(context),
              );
        },
      ),
      ActionViewProps(
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
    ];

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                      decoration:
                          task.checked ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  Text(TimeOfDay.fromDateTime(task.date).format(context)),
                ],
              ),
            ),
            Checkbox(
              value: task.checked,
              onChanged: (val) {
                taskState.updateTask(task.copyWith(checked: val));
              },
            ),
          ],
        ),
      ),
    );

    return TouchableOpacity(
      onLongPress: () {
        UtilView.showActionView(context, actions: actions);
      },
      child: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 250),
        child: body,
      ),
    );
  }
}

import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:daily_routine_app/src/task/task_controller.dart';
import 'package:daily_routine_app/src/widgets/add_update_task_view.dart';
import 'package:daily_routine_app/src/widgets/my_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FloatingButtonView extends StatelessWidget {
  const FloatingButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    final taskRead = context.read<TaskController>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KSize.s16),
      child: MyRow(
        spacing: KSize.s8,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () async {
              final task = await AddUpdateTaskView.show(context);
              if (task == null) return;
              taskRead.addTask(task);
            },
            child: const Icon(Icons.add),
          ),
          Builder(
            builder: (context) {
              return FloatingActionButton(
                onPressed: () async {
                  Scaffold.of(context).openEndDrawer();
                },
                child: const Icon(Icons.menu),
              );
            },
          )
        ],
      ),
    );
  }
}
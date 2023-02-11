import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:daily_routine_app/src/widgets/my_time_picker.dart';
import 'package:flutter/material.dart';

import '../constan/size.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({
    super.key,
  });

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final title = TextEditingController();
  var time = TimeOfDay.now();

  @override
  void dispose() {
    super.dispose();
    title.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: KSize.s16),
            child: Column(
              children: [
                TextFormField(
                  controller: title,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: KSize.s24,
          ),
          MyTimePickerDialog(
            initialEntryMode: TimePickerEntryMode.inputOnly,
            initialTime: TimeOfDay.now(),
            helpText: 'Enter Task Time',
            cancelText: '',
            confirmText: '',
            handleTimeChanged: (val) {
              time = val;
              setState(() {});
            },
          ),
          const Divider(),
          const SizedBox(
            height: KSize.s24,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, TaskModel(time: time, title: title.text));
            },
            child: const Text('Save'),
          ),
          const SizedBox(
            height: KSize.s24,
          ),
        ],
      ),
    );
  }
}

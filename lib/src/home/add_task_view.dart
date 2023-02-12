import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:daily_routine_app/src/widgets/my_time_picker.dart';
import 'package:flutter/material.dart';

import '../constan/size.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({
    super.key,
    this.task,
  });

  final TaskModel? task;

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  late final title = TextEditingController(text: widget.task?.title);
  late var time = widget.task?.time ?? TimeOfDay.now();

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
                  onChanged: (_) {
                    setState(() {});
                  },
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
            initialTime: time,
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
            onPressed: title.text.isEmpty
                ? null
                : () {
                    Navigator.pop(
                        context,
                        TaskModel(
                          id: widget.task?.id,
                          time: time,
                          title: title.text,
                        ));
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

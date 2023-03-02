import 'package:daily_routine_app/src/enums/task_type.dart';
import 'package:daily_routine_app/src/extensions/date_format_extension.dart';
import 'package:daily_routine_app/src/extensions/weekend_extension.dart';
import 'package:daily_routine_app/src/widgets/dropdown_modal_view.dart';
import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:daily_routine_app/src/extensions/list_extension.dart';
import 'package:daily_routine_app/src/utils/log_util.dart';
import 'package:daily_routine_app/src/widgets/my_card.dart';
import 'package:daily_routine_app/src/widgets/my_column.dart';
import 'package:daily_routine_app/src/widgets/touchable_opacity.dart';
import 'package:daily_routine_app/src/widgets/weekend_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constan/k_size.dart';

class AddUpdateTaskView extends StatefulWidget {
  static Future<TaskModel?> show(BuildContext context, {TaskModel? task}) {
    return showModalBottomSheet<TaskModel>(
        isScrollControlled: true,
        context: context,
        useSafeArea: true,
        builder: (context) {
          return AddUpdateTaskView(
            task: task,
          );
        });
  }

  static const name = 'AddTaskView';
  const AddUpdateTaskView({
    super.key,
    this.task,
  });

  final TaskModel? task;

  @override
  State<AddUpdateTaskView> createState() => _AddUpdateTaskViewState();
}

class _AddUpdateTaskViewState extends State<AddUpdateTaskView> {
  late final task = widget.task;
  final now = DateTime.now();

  late final title = TextEditingController(text: task?.title);
  late var date = task?.date;
  late var time = task?.time ?? TimeOfDay.now();
  late var listOfDays = task?.listOfDays ?? [];
  late var taskType = !listOfDays.isNullEmpty
      ? TaskType.recurring
      : date != null
          ? TaskType.single
          : null;

  @override
  void dispose() {
    super.dispose();
    title.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSingleTask = taskType == TaskType.single;
    final isRecurringTask = taskType == TaskType.recurring;

    listOfDays.sort((a, b) => a.index.compareTo(b.index));

    final checkRecurringTask = isRecurringTask ? !listOfDays.isNullEmpty : true;
    final checkSingleTask = isSingleTask ? date != null : true;
    final buttonEnable = taskType != null &&
        title.text.isNotEmpty &&
        checkRecurringTask &&
        checkSingleTask;
    final paddingKeyboard = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: KSize.s16).copyWith(
        bottom: paddingKeyboard,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: KSize.s24,
          ),
          MyColumn(
            spacing: KSize.s16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                onChanged: (_) {
                  setState(() {});
                },
                controller: title,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TouchableOpacity(
                onTap: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((value) {
                    if (value == null) return;
                    time = value;
                    setState(() {});
                  });
                },
                child: MyCard(text: time.format(context)),
              ),
              DropdownModalView<TaskType>(
                value: taskType,
                isExpanded: true,
                items: const [
                  ...TaskType.values,
                ],
                onChanged: (val) {
                  taskType = val;
                  setState(() {});
                },
              ),
              if (isSingleTask)
                TouchableOpacity(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: now,
                      lastDate: DateTime(now.year + 1),
                    ).then((value) {
                      if (value == null) return;
                      date = value;
                      setState(() {});
                    });
                  },
                  child: MyCard(
                    text: DateFormat.yMd().tryFormat(date),
                  ),
                ),
              if (isRecurringTask)
                TouchableOpacity(
                  onTap: () {
                    WeekendView.show(
                      context,
                      initialValue: listOfDays,
                    ).then((value) {
                      if (value == null) return;
                      listOfDays = value;
                      setState(() {});
                    });
                  },
                  child: MyCard(
                    text: listOfDays.isNullEmpty
                        ? 'Days'
                        : listOfDays.map((e) => e.formattedName).join(', '),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: KSize.s24),
            child: ElevatedButton(
              onPressed: !buttonEnable
                  ? null
                  : () {
                      Navigator.pop(
                        context,
                        TaskModel(
                          id: task?.id,
                          title: title.text,
                          listOfDays: isSingleTask ? [] : listOfDays,
                          date: isRecurringTask ? null : date,
                          time: time,
                        ),
                      );
                    },
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}

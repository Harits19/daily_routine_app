import 'package:daily_routine_app/src/constan/k_enum.dart';
import 'package:daily_routine_app/src/home/util_view.dart';
import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:daily_routine_app/src/utils/logger_util.dart';
import 'package:daily_routine_app/src/widgets/my_card.dart';
import 'package:daily_routine_app/src/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constan/size.dart';

class AddTaskView extends StatefulWidget {
  static const name = 'add-task-view';
  const AddTaskView({
    super.key,
    this.task,
  });

  final TaskModel? task;

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  late final task = widget.task;
  late final title = TextEditingController(text: task?.title);
  final now = DateTime.now();
  late var date = task?.date ?? now;
  late var time = TimeOfDay.fromDateTime(date);
  late var listOfDays = task?.listOfDays;
  final log = LoggerUtil(AddTaskView.name);

  @override
  void dispose() {
    super.dispose();
    title.dispose();
  }

  @override
  Widget build(BuildContext context) {
    listOfDays?.sort((a, b) => a.index.compareTo(b.index));
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KSize.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
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
            const SizedBox(
              height: KSize.s16,
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
            const SizedBox(
              height: KSize.s16,
            ),
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
              child: MyCard(text: DateFormat.yMd().format(date)),
            ),
            TouchableOpacity(
              onTap: () {
                UtilView.chooseWeekend(
                  context,
                  initialValue: listOfDays,
                ).then((value) {
                  listOfDays = value;
                  setState(() {});
                });
              },
              child: MyCard(
                text: listOfDays?.map((e) => e.formattedName).join(', '),
              ),
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
                            id: task?.id,
                            title: title.text,
                            listOfDays: listOfDays,
                            date: date.copyWith(
                              hour: time.hour,
                              minute: time.minute,
                            ),
                          ));
                    },
              child: const Text('Save'),
            ),
            const SizedBox(
              height: KSize.s24,
            ),
          ],
        ),
      ),
    );
  }
}

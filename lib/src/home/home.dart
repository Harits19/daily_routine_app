import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:daily_routine_app/src/extensions/date_time_extension.dart';
import 'package:daily_routine_app/src/extensions/int_extension.dart';
import 'package:daily_routine_app/src/widgets/add_button_view.dart';
import 'package:daily_routine_app/src/home/views/task_view.dart';
import 'package:daily_routine_app/src/widgets/util_view.dart';
import 'package:daily_routine_app/src/extensions/time_of_day_extension.dart';
import 'package:daily_routine_app/src/task/task_controller.dart';
import 'package:daily_routine_app/src/utils/log_util.dart';
import 'package:daily_routine_app/src/widgets/horizontal_calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const routeName = 'home_view';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final log = LogUtil(Home.routeName);
    final taskRead = context.read<TaskController>();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AddButtonView(
        onPressed: () async {
          final task = await UtilView.showTaskAddUpdate(context);
          if (task == null) return;
          taskRead.addTask(task);
        },
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: KSize.s16,
            ),
            HorizontalCalendarView(
              selectedDate: selectedDate,
              onChangedDate: (val) {
                selectedDate = val;
                setState(() {});
              },
            ),

            const SizedBox(
              height: KSize.s16,
            ),
            Consumer<TaskController>(builder: (context, task, child) {
              final sortedTask = [...task.data];
              sortedTask.sort((a, b) {
                return a.time.compareTo(b.time);
              });
              final filteredTask = sortedTask.where((element) {
                return element.listOfDays
                        .contains(selectedDate.weekday.toWeekend) ||
                    element.date.isSameDate(selectedDate);
              });
              log.info(sortedTask);
              return Column(
                children: [
                  ...filteredTask.map(
                    (e) => TaskView(task: e),
                  ),
                ],
              );
            }),

            //dummy add button
            const Opacity(
              opacity: 0,
              child: AddButtonView(),
            )
          ],
        ),
      ),
    );
  }
}
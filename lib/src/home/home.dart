import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:daily_routine_app/src/extensions/date_time_extension.dart';
import 'package:daily_routine_app/src/extensions/int_extension.dart';
import 'package:daily_routine_app/src/home/views/drawer_view.dart';
import 'package:daily_routine_app/src/home/views/floating_button_view.dart';
import 'package:daily_routine_app/src/home/views/task_view.dart';
import 'package:daily_routine_app/src/extensions/time_of_day_extension.dart';
import 'package:daily_routine_app/src/task/task_controller.dart';
import 'package:daily_routine_app/src/widgets/horizontal_calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      endDrawer: const DrawerView(),
      floatingActionButton: const FloatingButtonView(),
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
              final checkable = selectedDate.isSameDate(
                DateTime.now(),
              );
              return Column(
                children: [
                  ...filteredTask.map(
                    (e) => TaskView(
                      task: e,
                      checkable: checkable,
                    ),
                  ),
                ],
              );
            }),

            //dummy add button
            Opacity(
              opacity: 0,
              child: FloatingActionButton(
                onPressed: () {},
                child: const SizedBox(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

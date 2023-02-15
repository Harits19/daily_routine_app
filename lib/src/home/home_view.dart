import 'package:daily_routine_app/src/constan/size.dart';
import 'package:daily_routine_app/src/extensions/date_time_extension.dart';
import 'package:daily_routine_app/src/extensions/int_extension.dart';
import 'package:daily_routine_app/src/home/task_view.dart';
import 'package:daily_routine_app/src/home/util_view.dart';
import 'package:daily_routine_app/src/utils/time_of_day_util.dart';
import 'package:daily_routine_app/src/task/controller/task_controller.dart';
import 'package:daily_routine_app/src/utils/logger_util.dart';
import 'package:daily_routine_app/src/home/horizontal_calendar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  static const routeName = 'home_view';
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final log = LoggerUtil(HomeView.routeName);
    final taskRead = context.read<TaskController>();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AddButton(
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
            HorizontalCalendar(
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
              child: AddButton(),
            )
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(KSize.s16),
      child: FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:daily_routine_app/src/constan/date.dart';
import 'package:daily_routine_app/src/constan/size.dart';
import 'package:daily_routine_app/src/home/date_row_view.dart';
import 'package:daily_routine_app/src/home/task_view.dart';
import 'package:daily_routine_app/src/home/util_view.dart';
import 'package:daily_routine_app/src/utils/time_of_day_util.dart';
import 'package:daily_routine_app/src/task/controller/task_controller.dart';
import 'package:daily_routine_app/src/utils/date_util.dart';
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
    final totalDate = DateUtil.totalDate(selectedDate);
    final selectedMonth = selectedDate.month;
    final selectedYear = selectedDate.year;
    final selectedDay = selectedDate.day;
    final log = LoggerUtil(HomeView.routeName);
    final taskRead = context.read<TaskController>();

    log.info(totalDate);
    log.info(KDate.listOfMonths);
    log.info(TimeOfDay.now().toJson());

    DateTime getNextDay(DateTime nextDate) {
      var changedDay = selectedDay;
      log.info('next month before ${nextDate.month}');
      var totalDayChangedMonth = DateUtil.totalDate(nextDate);
      if (changedDay > totalDayChangedMonth) {
        changedDay = totalDayChangedMonth;
      }
      log.info(
          'total day next month : $totalDayChangedMonth, current month ${selectedDate.month},  next month ${nextDate.month} ');

      return nextDate.copyWith(day: changedDay);
    }

    void changeMonth(int many) {
      log.info('selected month $selectedMonth. many $many');
      final nextDate = DateTime(selectedYear, selectedMonth + many);
      selectedDate = getNextDay(nextDate);
      setState(() {});
    }

    void changeYear(int many) {
      final nextDate = DateTime(selectedYear + many, selectedMonth);
      selectedDate = getNextDay(nextDate);
      setState(() {});
    }

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
            DateRowView(
              text: selectedYear.toString(),
              onTapLeft: () {
                changeYear(-1);
              },
              onTapRight: () {
                changeYear(1);
              },
            ),
            DateRowView(
              text: KDate.listOfMonths[selectedMonth],
              onTapLeft: () {
                changeMonth(-1);
              },
              onTapRight: () {
                changeMonth(1);
              },
            ),
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
              log.info(sortedTask);
              return Column(
                children: [
                  ...sortedTask.map(
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

import 'package:daily_routine_app/src/app/app_controller.dart';
import 'package:daily_routine_app/src/checked_task/checked_task_controller.dart';
import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:daily_routine_app/src/extensions/date_time_extension.dart';
import 'package:daily_routine_app/src/extensions/int_extension.dart';
import 'package:daily_routine_app/src/home/views/task_view.dart';
import 'package:daily_routine_app/src/widgets/add_update_task_view.dart';
import 'package:daily_routine_app/src/extensions/time_of_day_extension.dart';
import 'package:daily_routine_app/src/task/task_controller.dart';
import 'package:daily_routine_app/src/utils/log_util.dart';
import 'package:daily_routine_app/src/widgets/confirm_import_view.dart';
import 'package:daily_routine_app/src/widgets/horizontal_calendar_view.dart';
import 'package:daily_routine_app/src/widgets/my_bottom_sheet_view.dart';
import 'package:daily_routine_app/src/widgets/my_column.dart';
import 'package:daily_routine_app/src/widgets/my_row.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      endDrawer: const _Drawer(),
      floatingActionButton: const _FloatingButton(),
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

class _FloatingButton extends StatelessWidget {
  const _FloatingButton();

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

class _Drawer extends StatelessWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context) {
    final checkedTaskRead = context.read<CheckedTaskController>();
    final appRead = context.read<AppController>();

    return Drawer(
      width: MediaQuery.of(context).size.width / 2,
      child: Padding(
        padding: const EdgeInsets.all(KSize.s16),
        child: MyColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                showModalBottomSheet<ThemeMode>(
                  context: context,
                  builder: (context) =>
                      Consumer<AppController>(builder: (context, state, child) {
                    return MyBottomSheetView<ThemeMode>(
                      value: state.themeMode,
                      items: ThemeMode.values,
                    );
                  }),
                ).then((value) {
                  if (value == null) return;
                  appRead.setThemeMode(value);
                });
              },
              child: const Text("Theme"),
            ),
            TextButton(
              onPressed: () {
                ConfirmImportView.show(context).then((confirmImport) {
                  if (confirmImport) {
                    checkedTaskRead.import();
                    Navigator.pop(context);
                  }
                });
              },
              child: const Text('Import'),
            ),
            TextButton(
              onPressed: () {
                checkedTaskRead.export();
                Navigator.pop(context);
              },
              child: const Text('Export'),
            ),
            const SizedBox(
              height: KSize.s16,
            ),
            Consumer<AppController>(builder: (context, state, child) {
              return Text(
                "version ${state.packageInfo?.version}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: KSize.s8),
              );
            }),
          ],
        ),
      ),
    );
  }
}

import 'package:daily_routine_app/src/app/app_controller.dart';
import 'package:daily_routine_app/src/checked_task/checked_task_controller.dart';
import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:daily_routine_app/src/widgets/confirm_import_view.dart';
import 'package:daily_routine_app/src/widgets/my_bottom_sheet_view.dart';
import 'package:daily_routine_app/src/widgets/my_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

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
                    builder: (context) => Consumer<AppController>(
                        builder: (context, state, child) {
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
                child: const Text("Theme")),
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

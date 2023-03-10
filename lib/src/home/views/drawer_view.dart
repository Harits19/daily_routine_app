import 'package:daily_routine_app/src/app/app_controller.dart';
import 'package:daily_routine_app/src/checked_task/checked_task_controller.dart';
import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:daily_routine_app/src/enums/my_language.dart';
import 'package:daily_routine_app/src/extensions/string_extension.dart';
import 'package:daily_routine_app/src/enums/localization.dart';
import 'package:daily_routine_app/src/widgets/confirm_import_view.dart';
import 'package:daily_routine_app/src/widgets/my_bottom_sheet_view.dart';
import 'package:daily_routine_app/src/widgets/my_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerView extends ConsumerWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkedTaskRead = ref.read(checkedTaskProvider.notifier);

    final appRead = ref.read(appProvider.notifier);
    final appWatch = ref.watch(appProvider);

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
                showModalBottomSheet<MyLanguage>(
                  context: context,
                  builder: (context) => MyBottomSheetView<MyLanguage>(
                    value: ref.watch(appProvider).myLanguage,
                    items: MyLanguage.values,
                    textItem: (val) {
                      return val.name.toUpperCase();
                    },
                  ),
                ).then((value) {
                  if (value == null) return;
                  appRead.setLanguage(value);
                });
              },
              child: const Text("Language"),
            ),
            TextButton(
              onPressed: () {
                showModalBottomSheet<ThemeMode>(
                  context: context,
                  builder: (context) => MyBottomSheetView<ThemeMode>(
                    value: appWatch.themeMode,
                    items: ThemeMode.values,
                    textItem: (val) {
                      return val.name.toCapitalize;
                    },
                  ),
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
            Text(
              "${T.version.text(appWatch.myLanguage)} ${appWatch.packageInfo?.version}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: KSize.s8),
            )
          ],
        ),
      ),
    );
  }
}

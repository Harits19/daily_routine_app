import 'package:daily_routine_app/src/enums/weekend.dart';
import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:daily_routine_app/src/extensions/weekend_extension.dart';
import 'package:daily_routine_app/src/widgets/action_view.dart';
import 'package:daily_routine_app/src/widgets/my_card.dart';
import 'package:daily_routine_app/src/widgets/my_column.dart';
import 'package:daily_routine_app/src/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';

class UtilView {
  static Future<void> showActionView(
    BuildContext context, {
    required List<ActionView> actions,
  }) {
    return showModalBottomSheet(
        context: context,
        builder: ((context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...actions.map(
                (e) => e,
              ),
            ],
          );
        }));
  }

  static Future<List<Weekend>?> chooseWeekend(
    BuildContext context, {
    List<Weekend>? initialValue,
  }) {
    return showModalBottomSheet<List<Weekend>>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        var listOfDays = [...initialValue ?? <Weekend>[]];
        return StatefulBuilder(builder: (context, localState) {
          return Padding(
            padding: const EdgeInsets.all(KSize.s16),
            child: MyColumn(
              spacing: KSize.s16,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...Weekend.values.map(
                  (e) {
                    final isSelected = listOfDays.contains(e);
                    return TouchableOpacity(
                      onTap: () {
                        if (isSelected) {
                          listOfDays.removeWhere(
                            (element) => element == e,
                          );
                        } else {
                          listOfDays.add(e);
                        }
                        localState(() {});
                      },
                      child: MyCard(
                        isSelected: isSelected,
                        text: e.formattedName,
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, listOfDays);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}

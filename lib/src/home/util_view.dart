import 'package:daily_routine_app/src/constan/k_enum.dart';
import 'package:daily_routine_app/src/constan/size.dart';
import 'package:daily_routine_app/src/home/action_view.dart';
import 'package:daily_routine_app/src/home/add_task_view.dart';
import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:daily_routine_app/src/widgets/my_card.dart';
import 'package:daily_routine_app/src/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';

class UtilView {
  static Future<TaskModel?> showTaskAddUpdate(BuildContext context,
      {TaskModel? task}) {
    return showModalBottomSheet<TaskModel>(
        isScrollControlled: true,
        context: context,
        useSafeArea: true,
        builder: (context) {
          return AddTaskView(
            task: task,
          );
        });
  }

  static Future<void> showActionView(
    BuildContext context, {
    required List<ActionViewProps> actions,
  }) {
    return showModalBottomSheet(
        context: context,
        builder: ((context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...actions.map(
                (e) => ActionView(e: e),
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
            child: Column(
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
    ).then((value) {
      if (value == null) return initialValue;
      return value;
    });
  }
}

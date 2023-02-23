import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:daily_routine_app/src/utils/log_util.dart';
import 'package:daily_routine_app/src/widgets/my_card.dart';
import 'package:daily_routine_app/src/widgets/my_column.dart';
import 'package:daily_routine_app/src/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';

class MyBottomSheetView<T> extends StatelessWidget {
  const MyBottomSheetView({
    super.key,
    required this.items,
    this.value,
  });

  final List<T> items;
  final T? value;

  @override
  Widget build(BuildContext context) {
    myPrint(value);
    return Padding(
      padding: const EdgeInsets.all(
        KSize.s16,
      ),
      child: MyColumn(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: KSize.s16,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...items.map((e) {
            return TouchableOpacity(
              onTap: () {
                Navigator.pop(context, e);
              },
              child: MyCard(
                isSelected: value == e,
                text: e.toString(),
              ),
            );
          })
        ],
      ),
    );
  }
}

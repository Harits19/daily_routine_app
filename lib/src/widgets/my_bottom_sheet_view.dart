import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:daily_routine_app/src/widgets/my_card.dart';
import 'package:daily_routine_app/src/widgets/my_column.dart';
import 'package:daily_routine_app/src/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';

class MyBottomSheetView<T> extends StatelessWidget {
  const MyBottomSheetView({
    super.key,
    required this.items,
    this.value,
    this.textItem,
  });

  final List<T> items;
  final T? value;
  final String Function(T value)? textItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        KSize.s16,
      ),
      child: MyColumn(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: KSize.s16,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...List.generate(
            items.length,
            (index) {
              final e = items[index];
              return TouchableOpacity(
                onTap: () {
                  Navigator.pop(context, e);
                },
                child: MyCard(
                  isSelected: value == e,
                  text: textItem != null ? textItem!(e) : e.toString(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

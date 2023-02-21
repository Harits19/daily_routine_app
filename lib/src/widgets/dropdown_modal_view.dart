import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:daily_routine_app/src/widgets/my_card.dart';
import 'package:daily_routine_app/src/widgets/my_column.dart';
import 'package:daily_routine_app/src/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';

class DropdownModalView<T> extends StatelessWidget {
  const DropdownModalView({
    super.key,
    this.items = const [],
    this.value,
    this.isExpanded = false,
    this.onChanged,
  });
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final bool isExpanded;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
        onTap: () async {
          final selectedValue = await showModalBottomSheet<T>(
              context: context,
              builder: (context) {
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
                            Navigator.pop(context, e.value);
                          },
                          child: MyCard(
                            text: e.value.toString(),
                          ),
                        );
                      })
                    ],
                  ),
                );
              });
          if (onChanged == null) return;
          onChanged!(selectedValue);
        },
        child: Container(
          color: Colors.transparent,
          child: IgnorePointer(
            ignoring: true,
            child: DropdownButton<T>(
              value: value,
              items: items,
              isExpanded: isExpanded,
              onChanged: (val) {},
            ),
          ),
        ));
  }
}

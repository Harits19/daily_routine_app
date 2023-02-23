import 'package:daily_routine_app/src/widgets/my_bottom_sheet_view.dart';
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
  final List<T> items;
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
              return MyBottomSheetView(
                items: items,
                value: value,
              );
            },
          );
          if (onChanged == null || selectedValue == null) return;
          onChanged!(selectedValue);
        },
        child: Container(
          color: Colors.transparent,
          child: IgnorePointer(
            ignoring: true,
            child: DropdownButton<T>(
              value: value,
              items: [
                ...items.map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e.toString(),
                    ),
                  ),
                )
              ],
              isExpanded: isExpanded,
              onChanged: (val) {},
            ),
          ),
        ));
  }
}

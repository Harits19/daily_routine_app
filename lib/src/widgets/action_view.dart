import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:daily_routine_app/src/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';

class ActionView extends StatelessWidget {
  const ActionView({super.key, required this.actions});

  static Future<void> show(
    BuildContext context, {
    required List<ActionItem> actions,
  }) {
    return showModalBottomSheet(
        context: context,
        builder: ((context) {
          return ActionView(actions: actions);
        }));
  }

  final List<ActionItem> actions;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...actions.map((e) => TouchableOpacity(
          onTap: e.onPress,
          child: Card(
            margin: const EdgeInsets.all(KSize.s8),
            child: Padding(
              padding: const EdgeInsets.all(KSize.s16),
              child: Row(
                children: [
                  Icon(e.icon),
                  const SizedBox(
                    width: KSize.s8,
                  ),
                  Text(e.text)
                ],
              ),
            ),
          ),
        )),
      ],
    );
  }
}

class ActionItem {
  final String text;
  final IconData icon;
  final VoidCallback onPress;

  const ActionItem({
    required this.text,
    required this.icon,
    required this.onPress,
  });
}

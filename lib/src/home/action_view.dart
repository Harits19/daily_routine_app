import 'package:daily_routine_app/src/constan/size.dart';
import 'package:daily_routine_app/src/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';

class ActionViewProps {
  String text;
  IconData icon;
  VoidCallback onPress;
  ActionViewProps({
    required this.text,
    required this.icon,
    required this.onPress,
  });
}

class ActionView extends StatelessWidget {
  const ActionView({
    super.key,
    required this.e,
  });

  final ActionViewProps e;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
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
    );
  }
}

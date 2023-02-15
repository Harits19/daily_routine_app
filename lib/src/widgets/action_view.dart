import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:daily_routine_app/src/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';

class ActionView extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPress;
  const ActionView({
    super.key,
    required this.text,
    required this.icon,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onPress,
      child: Card(
        margin: const EdgeInsets.all(KSize.s8),
        child: Padding(
          padding: const EdgeInsets.all(KSize.s16),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(
                width: KSize.s8,
              ),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:daily_routine_app/src/constan/size.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.text,
    this.isSelected = false,
  });

  final String? text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      color: isSelected ? Colors.blue : null,
      child: Padding(
        padding: const EdgeInsets.all(KSize.s16),
        child: Text(
          text ?? "-",
          style: TextStyle(
            color: isSelected ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}

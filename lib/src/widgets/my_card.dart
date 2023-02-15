import 'package:daily_routine_app/src/constan/size.dart';
import 'package:flutter/material.dart';

class MyCard extends Card {
  MyCard({
    super.key,
    super.borderOnForeground,
    super.clipBehavior,
    Color? color,
    super.elevation,
    super.margin = EdgeInsets.zero,
    super.semanticContainer,
    super.shadowColor,
    super.shape,
    super.surfaceTintColor,
    bool isSelected = false,
    String? text,
  }) : super(
          color: isSelected ? Colors.blue : color,
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

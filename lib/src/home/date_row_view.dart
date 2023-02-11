import 'package:flutter/material.dart';

class DateRowView extends StatelessWidget {
  const DateRowView({
    super.key,
    required this.text,
    required this.onTapLeft,
    required this.onTapRight,
  });

  final VoidCallback onTapLeft;
  final VoidCallback onTapRight;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_left_rounded),
          onPressed: onTapLeft,
        ),
        Text(text),
        IconButton(
          icon: const Icon(Icons.arrow_right_rounded),
          onPressed: onTapRight,
        ),
      ],
    );
  }
}

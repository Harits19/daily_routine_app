import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:flutter/material.dart';

class AddButtonView extends StatelessWidget {
  const AddButtonView({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(KSize.s16),
      child: FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:daily_routine_app/src/constan/size.dart';
import 'package:flutter/material.dart';

class TaskView extends StatefulWidget {
  const TaskView({
    super.key,
  });

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      opacity = 1;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 250),
      child: Card(
        margin: const EdgeInsets.symmetric(
            horizontal: KSize.s16, vertical: KSize.s8),
        child: Padding(
          padding: const EdgeInsets.all(KSize.s16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Text(
                      'Title',
                    ),
                    Text('Time'),
                  ],
                ),
              ),
              Checkbox(
                value: false,
                onChanged: (val) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

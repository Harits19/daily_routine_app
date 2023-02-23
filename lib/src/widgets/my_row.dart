import 'package:flutter/material.dart';

class MyRow extends Row {
  MyRow({
    super.key,
    List<Widget> children = const [],
    super.crossAxisAlignment,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    double spacing = 0,
  }) : super(
            children: List.generate(children.length, (index) {
          final isFirst = index == 0;
          return Padding(
            padding: EdgeInsets.only(left: isFirst ? 0 : spacing),
            child: children[index],
          );
        }));
}

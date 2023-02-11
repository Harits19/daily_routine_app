import 'package:flutter/material.dart';

class TouchableOpacity extends StatefulWidget {
  const TouchableOpacity({Key? key, required this.child, this.onTap})
      : super(key: key);
  final Widget child;
  final VoidCallback? onTap;
  static const name = 'touchable_opacity';
  static const defaultOpacity = 0.5;
  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (val) {
        opacity = TouchableOpacity.defaultOpacity;
        setState(() {});
      },
      onTapUp: (val) {
        opacity = 1;
        setState(() {});
      },
      onTapCancel: () => setState(() {
        opacity = 1;
        setState(() {});
      }),
      child: Opacity(
        opacity: opacity,
        child: widget.child,
      ),
    );
  }
}

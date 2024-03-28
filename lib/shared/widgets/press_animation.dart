import 'package:flutter/material.dart';

class PressAnimationWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const PressAnimationWidget({
    required this.child,
    this.onTap,
    this.onLongPress,
  });

  @override
  _PressAnimationWidgetState createState() => _PressAnimationWidgetState();
}

class _PressAnimationWidgetState extends State<PressAnimationWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final matrix4Show = Matrix4.identity()..scale(1.02);
    final matrix4Hide = Matrix4.identity()..scale(1.0);

    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: _isPressed ? matrix4Show : matrix4Hide,
        child: widget.child,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/constants/colors.dart';

class LoadingBlocksInteraction extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingBlocksInteraction({
    super.key,
    required this.child,
    required this.isLoading,
  });
  @override
  Widget build(BuildContext context) {
    if (!isLoading) return child;
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: ModalBarrier(
            dismissible: false,
            color: ColorConstants.white.withOpacity(0.1),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task_manager/shared/widgets/icons/base/svg_icon.dart';

class PersionAddIcon extends StatelessWidget {
  final double? width;
  final String assetName;

  const PersionAddIcon({
    super.key,
    this.width,
    this.assetName = 'add_friend',
  });

  @override
  Widget build(BuildContext context) {
    return SvgIcon(
      assetName: assetName,
      width: width,
    );
  }
}

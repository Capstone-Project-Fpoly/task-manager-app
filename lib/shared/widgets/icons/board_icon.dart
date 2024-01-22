import 'package:flutter/material.dart';
import 'package:task_manager/shared/widgets/icons/base/png_icon.dart';

class BoardIcon extends StatelessWidget {
  final double? width;
  final String assetName;

  const BoardIcon({
    super.key,
    this.width,
    this.assetName = 'icon_broad',
  });

  const BoardIcon.color({
    super.key,
    this.width,
    this.assetName = 'icon_broad_color',
  });

  @override
  Widget build(BuildContext context) {
    return PngIcon(
      assetName: assetName,
      width: width,
    );
  }
}

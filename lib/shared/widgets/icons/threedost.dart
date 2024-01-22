import 'package:flutter/material.dart';
import 'package:task_manager/shared/widgets/icons/base/png_icon.dart';

class ThreeDostIcon extends StatelessWidget {
  final double? width;
  final String assetName;

  const ThreeDostIcon({
    super.key,
    this.width,
    this.assetName = 'icon_threedost',
  });

  @override
  Widget build(BuildContext context) {
    return PngIcon(
      assetName: assetName,
      width: width,
    );
  }
}

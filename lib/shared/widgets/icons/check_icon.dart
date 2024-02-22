import 'package:flutter/material.dart';
import 'package:task_manager/shared/widgets/icons/base/png_images.dart';

class CheckIcon extends StatelessWidget {
  final double? width;
  final String assetName;
  final Color? color;

  const CheckIcon({
    super.key,
    this.width,
    this.assetName = 'check',
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return PngImages(
      assetName: assetName,
      width: width,
      color: color,
    );
  }
}

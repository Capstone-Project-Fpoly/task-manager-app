import 'package:flutter/material.dart';
import 'package:task_manager/shared/widgets/icons/base/png_images.dart';

class CardIcon extends StatelessWidget {
  final double? width;
  final String assetName;
  final Color? color;

  const CardIcon({
    super.key,
    this.width,
    this.assetName = 'card',
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

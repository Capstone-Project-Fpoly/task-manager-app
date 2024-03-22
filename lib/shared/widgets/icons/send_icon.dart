import 'package:flutter/material.dart';
import 'package:task_manager/shared/widgets/icons/base/png_images.dart';

class SendIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final String assetName;
  final Color? color;

  const SendIcon({
    super.key,
    this.width,
    this.assetName = 'send',
    this.color,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return PngImages(
      assetName: assetName,
      width: width,
      color: color,
      height: height,
    );
  }
}

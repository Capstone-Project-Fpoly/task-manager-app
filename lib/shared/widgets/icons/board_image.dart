import 'package:flutter/material.dart';
import 'package:task_manager/shared/widgets/icons/base/png_images.dart';

class BoardImages extends StatelessWidget {
  final String? assetName;
  final double? width;
  final double? height;
  final Color? color;

  const BoardImages({
    super.key,
    this.assetName,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return PngImages(
      assetName: 'image_board',
      width: width,
      height: height,
    );
  }
}
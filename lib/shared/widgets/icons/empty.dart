import 'package:flutter/material.dart';
import 'package:task_manager/shared/widgets/icons/base/png_icon.dart';
import 'package:task_manager/shared/widgets/icons/base/png_images.dart';

class EmptyIcon extends StatelessWidget {
  final double? width;
  final String assetName;

  const EmptyIcon({
    super.key,
    this.width,
    this.assetName = 'empty_folder',
  });

  @override
  Widget build(BuildContext context) {
    return PngImages(
      assetName: assetName,
      width: width,
    );
  }
}

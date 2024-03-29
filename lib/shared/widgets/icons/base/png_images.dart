import 'package:flutter/material.dart';

class PngImages extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;

  const PngImages({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$assetName.png',
      width: width,
      height: height,
      color: color,
    );
  }
}

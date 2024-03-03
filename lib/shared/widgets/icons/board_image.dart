import 'package:flutter/material.dart';

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
    return Image.asset(
      'assets/images/image_board.png',
      width: width,
      height: height,
      color: color,
    );
  }
}
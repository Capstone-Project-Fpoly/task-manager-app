import 'package:flutter/material.dart';
import 'package:task_manager/shared/widgets/icons/base/svg_icon.dart';

class GoogleIcon extends StatelessWidget {
  final double? width;
  final String assetName;

  const GoogleIcon({
    super.key,
    this.width,
    this.assetName = 'google',
  });

  @override
  Widget build(BuildContext context) {
    return SvgIcon(
      assetName: assetName,
      width: width,
    );
  }
}

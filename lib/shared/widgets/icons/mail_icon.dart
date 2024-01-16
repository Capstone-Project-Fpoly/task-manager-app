import 'package:flutter/material.dart';
import 'package:task_manager/shared/widgets/icons/base/svg_icon.dart';

class MailIcon extends StatelessWidget {
  final double? width;
  final String assetName;

  const MailIcon({
    super.key,
    this.width,
    this.assetName = 'post_office',
  });

  @override
  Widget build(BuildContext context) {
    return SvgIcon(
      assetName: assetName,
      width: width,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task_manager/shared/widgets/icons/base/svg_icon.dart';

class SortIcon extends StatelessWidget {
  final double? width;
  final String assetName;

  const SortIcon({
    super.key,
    this.width,
    this.assetName = 'sort',
  });

  @override
  Widget build(BuildContext context) {
    return SvgIcon(
      assetName: assetName,
      width: width,
    );
  }
}

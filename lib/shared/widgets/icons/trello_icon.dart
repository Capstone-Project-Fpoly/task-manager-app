import 'package:flutter/material.dart';
import 'package:task_manager/shared/widgets/icons/base/svg_icon.dart';

class TrelloIcon extends StatelessWidget {
  final double? width;
  final String assetName;
  final Color? color;

  const TrelloIcon({
    super.key,
    this.width,
    this.assetName = 'trello',
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgIcon(
      assetName: assetName,
      width: width,
      color: color,
    );
  }
}

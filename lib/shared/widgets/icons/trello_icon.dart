import 'package:flutter/material.dart';
import 'package:task_manager/shared/widgets/icons/base/svg_icon.dart';

class TrelloIcon extends StatelessWidget {
  final double? width;
  final String assetName;

  const TrelloIcon({
    super.key,
    this.width,
    this.assetName = 'trello',
  });

  @override
  Widget build(BuildContext context) {
    return SvgIcon(
      assetName: assetName,
      width: width,
    );
  }
}

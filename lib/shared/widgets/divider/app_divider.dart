import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/colors.dart';

class AppDivider extends ConsumerWidget {
  final double? height;
  final double? thickness;
  const AppDivider({
    super.key,
    this.height = 12,
    this.thickness = 0.5,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Divider(
      height: height,
      thickness: thickness,
      color: ColorConstants.darkColor.withOpacity(0.1),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task_manager/constants/colors.dart';

class ColorUtils {
  static Color getColorFromHex(String? hexColor) {
    if (hexColor == null) return ColorConstants.primary;
    final hexCode = hexColor.replaceAll('#', '');
    if (hexCode.length == 6) {
      hexColor = 'FF$hexCode';
    }
    final colorValue = int.tryParse(hexColor, radix: 16);
    return colorValue != null ? Color(colorValue) : Colors.white;
  }

  static String getHexFromColor(Color color) {
    return color.value.toRadixString(16).substring(2);
  }
}

import 'package:flutter/material.dart';
import 'package:task_manager/constants/colors.dart';

class AppTextStyle extends TextStyle {
  const AppTextStyle({
    super.fontSize = 14,
    super.color = ColorConstants.primaryText,
    super.fontWeight = FontWeight.w400,
    super.fontStyle = FontStyle.normal,
    super.height = 1.3,
    super.decoration,
    super.fontFamily = 'AvertaStdCY',
  });

  const AppTextStyle.white({
    Color color = ColorConstants.white,
    FontWeight? fontWeight,
    double? fontSize,
  }) : this(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
        );

  const AppTextStyle.error({
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration? decoration,
  }) : this(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: ColorConstants.error,
        );

  const AppTextStyle.link({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration? decoration = TextDecoration.underline,
  }) : this(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: ColorConstants.error,
          decoration: decoration,
        );
}

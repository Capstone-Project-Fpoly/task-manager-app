import 'package:flutter/material.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'AvertaStdCY',
    brightness: Brightness.light,
    primaryColor: ColorConstants.primary,
    colorScheme:
        ColorScheme.fromSeed(seedColor: ColorConstants.primary).copyWith(
      error: ColorConstants.error,
    ),
    textTheme: const TextTheme(
      bodyLarge: AppTextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorConstants.primaryText,
      ),
      bodyMedium: AppTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorConstants.primaryText,
      ),
      bodySmall: AppTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: ColorConstants.primaryText,
      ),
      displayLarge: TextStyle(
        fontWeight: FontWeight.w500,
        color: ColorConstants.primaryText,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w500,
        color: ColorConstants.primaryText,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w500,
        color: ColorConstants.primaryText,
      ),
      titleLarge: AppTextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorConstants.primaryText,
      ),
      titleMedium: AppTextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorConstants.primaryText,
      ),
      titleSmall: AppTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorConstants.primaryText,
      ),
      headlineLarge: AppTextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorConstants.primaryText,
      ),
      headlineMedium: AppTextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorConstants.primaryText,
      ),
      headlineSmall: AppTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorConstants.primaryText,
      ),
      labelLarge: AppTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorConstants.primaryText,
      ),
      labelMedium: AppTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: ColorConstants.primaryText,
      ),
      labelSmall: AppTextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: ColorConstants.primaryText,
      ),
    ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: ColorConstants.white,
      dialBackgroundColor: ColorConstants.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.primary,
      ),
    ),
    iconTheme: const IconThemeData(color: ColorConstants.primary),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstants.primary,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorConstants.white),
      titleTextStyle: AppTextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorConstants.white,
      ),
    ),
    scaffoldBackgroundColor: ColorConstants.background,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorConstants.white,
      surfaceTintColor: ColorConstants.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    ),
  );

  static PageTransitionsTheme pageTransitionsTheme = const PageTransitionsTheme(
    // Transitions between screens on different platforms
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  AppTheme._();
}

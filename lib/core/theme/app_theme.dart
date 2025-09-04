import 'package:apple_store/core/theme/app_text_theme.dart';
import 'package:apple_store/core/utils/const_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: AppTextTheme.lightTextTheme,
    colorScheme: ColorScheme.light(
      surface: ConstColors.materialCreamWhite,
      onSurface: ConstColors.materialBlack,
      primary: ConstColors.materialDarkGrey,
      onPrimary: ConstColors.materialGrey,
      secondary: ConstColors.materialBlue,
      onSecondary: ConstColors.materialWhite,
      errorContainer: ConstColors.materialRed,
      primaryContainer: ConstColors.materialOrange,
      secondaryContainer: ConstColors.materialPurple,
    ),
  );
}

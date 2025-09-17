import 'package:apple_store/core/theme/app_text_theme.dart';
import 'package:apple_store/core/utils/const_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: AppTextTheme.lightTextTheme,
    colorScheme: const ColorScheme.light(
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

    inputDecorationTheme: const InputDecorationThemeData(
      contentPadding: EdgeInsets.only(top: 2),
      border: OutlineInputBorder(borderSide: BorderSide.none),
    ),
    iconTheme: const IconThemeData(color: ConstColors.materialWhite),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 25),
      selectedItemColor: ConstColors.materialBlue,
      unselectedItemColor: ConstColors.materialBlack,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}

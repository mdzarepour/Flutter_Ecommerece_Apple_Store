import 'package:apple_store/core/utils/const_colors.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static const TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'SB',
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: ConstColors.materialWhite,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'SB',
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: ConstColors.materialWhite,
    ),
    // titleLarge:
    // titleMedium:
    // titleSmall:
    // bodyLarge:
    // bodyMedium:
    // bodySmall:
    // displayMedium:
  );
}

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
    headlineSmall: TextStyle(
      fontFamily: 'SB',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: ConstColors.materialGrey,
    ),
    bodySmall: TextStyle(
      fontFamily: 'SB',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: ConstColors.materialBlack,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'SB',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: ConstColors.materialGrey,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'SB',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: ConstColors.materialBlue,
    ),
    displayLarge: TextStyle(
      fontFamily: 'SM',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: ConstColors.materialWhite,
    ),
    displayMedium: TextStyle(
      fontFamily: 'SM',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ConstColors.materialWhite,
    ),
    displaySmall: TextStyle(
      fontFamily: 'SM',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ConstColors.materialBlack,
    ),
    labelLarge: TextStyle(
      fontFamily: 'SB',
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: ConstColors.materialWhite,
    ),
  );
}

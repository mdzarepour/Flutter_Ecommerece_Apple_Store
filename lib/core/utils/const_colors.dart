import 'package:flutter/material.dart';

class ConstColors {
  static const Color materialWhite = Color(0xFFFFFFFF);
  static const Color materialCreamWhite = Color(0xFFEEEEEE);
  static const Color materialBlack = Color(0xFF000000);
  static const Color materialBlue = Color(0xFF253DEE);
  static const Color materialSoftBlue = Color(0xFF58AEE8);
  static const Color materialGrey = Color(0xFF858585);
  static const Color materialDarkGrey = Color(0xFF393939);
  static const Color materialGreen = Color(0xFF1DB68B);
  static const Color materialRed = Color(0xFFD02026);
  static const Color materialPurple = Color(0xFF6866F9);
  static const Color materialOrange = Color(0xFFFBAD40);
}

class ConstGradients {
  static const LinearGradient splashScreenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 88, 174, 232),
      Color.fromARGB(255, 59, 95, 223),
    ],
  );
  static const LinearGradient bottomNavigationGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(255, 255, 255, 40),
      Color.fromRGBO(255, 255, 255, 10),
    ],
  );
}

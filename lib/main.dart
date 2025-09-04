import 'package:apple_store/core/theme/app_theme.dart';
import 'package:apple_store/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashScreen(),
    );
  }
}

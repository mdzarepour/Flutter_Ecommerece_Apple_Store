import 'package:apple_store/core/utils/const_colors.dart';
import 'package:apple_store/core/utils/const_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scheme = Theme.of(context).colorScheme;
    final textThme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: ConstGradients.splashScreenGradient,
        ),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.085),
            _buildSplashScreenUpperSection(size, textThme),
            __buildSplashScreenBottomSection(size, scheme, textThme),
          ],
        ),
      ),
    );
  }

  Stack __buildSplashScreenBottomSection(size, scheme, textTheme) {
    return Stack(
      children: [
        Image.asset(scale: 1.2, 'assets/images/pattern.png'),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: double.infinity),
              SizedBox(height: size.height * 0.115),
              Text(
                style: textTheme.headlineMedium,
                textDirection: TextDirection.rtl,
                ConstStrings.splashScreenMessage,
              ),
              SizedBox(height: size.height * 0.030),
              CircleAvatar(
                backgroundColor: scheme.secondary,
                radius: 35,
                child: SvgPicture.asset('assets/icons/arrow_icon.svg'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Stack _buildSplashScreenUpperSection(Size size, textTheme) {
    return Stack(
      children: [
        SvgPicture.asset('assets/images/splash.svg'),
        Positioned(
          bottom: 0,
          top: 0,
          left: 0,
          right: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Vector.png'),
              SizedBox(height: size.height * 0.015),
              Text(
                style: textTheme.headlineLarge,
                ConstStrings.splashScreenTitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

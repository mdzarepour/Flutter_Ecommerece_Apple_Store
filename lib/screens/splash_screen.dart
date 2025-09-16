import 'package:apple_store/core/utils/const_colors.dart';
import 'package:apple_store/core/utils/const_strings.dart';
import 'package:apple_store/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: ConstGradients.splashScreenGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildSplashScreenUpperSection(size, textTheme, scheme),
              _buildSplashScreenBottomSection(size, scheme, textTheme, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSplashScreenUpperSection(size, textTheme, scheme) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: _ConcentricCirclesPainter(color: scheme.onSecondary),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.apple, size: 125),
              Text(
                ConstStrings.splashScreenTitle,
                style: textTheme.headlineLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSplashScreenBottomSection(size, scheme, textTheme, context) {
    return Expanded(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/pattern.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Text(
                  ConstStrings.splashScreenMessage,
                  style: textTheme.headlineMedium,
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 35),
                InkWell(
                  onTap: () {
                    final route = CupertinoPageRoute(
                      builder: (context) => const HomeScreen(),
                    );
                    Navigator.pushReplacement(context, route);
                  },
                  child: CircleAvatar(
                    backgroundColor: scheme.secondary,
                    radius: size.height * 0.04,
                    child: CircleAvatar(
                      backgroundColor: scheme.onSecondary,
                      child: Icon(Icons.arrow_back, color: scheme.secondary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ConcentricCirclesPainter extends CustomPainter {
  final Color color;

  const _ConcentricCirclesPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()..style = PaintingStyle.fill;

    for (int i = 3; i <= 5; i++) {
      paint.color = color.withAlpha(i * 10);
      canvas.drawCircle(center, i * 30.0, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ConcentricCirclesPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

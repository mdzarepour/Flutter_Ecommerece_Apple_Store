import 'package:apple_store/core/utils/const_colors.dart';
import 'package:apple_store/core/utils/const_strings.dart';
import 'package:apple_store/screens/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HelperLinkWidget extends StatelessWidget {
  final String title;
  const HelperLinkWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                Text(title, style: textTheme.bodyMedium),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    final route = CupertinoPageRoute(
                      builder: (context) {
                        return const ProductScreen();
                      },
                    );
                    Navigator.of(context).push(route);
                  },
                  child: Row(
                    children: [
                      Text(
                        style: textTheme.bodyLarge,
                        ConstStrings.homeScreenleperLink,
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Iconsax.arrow_circle_left,
                        color: ConstColors.materialBlue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

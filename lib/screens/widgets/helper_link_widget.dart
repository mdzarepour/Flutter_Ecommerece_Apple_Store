import 'package:apple_store/core/utils/const_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HelperLinkWidget extends StatelessWidget {
  final String title;
  const HelperLinkWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: Row(
          children: [
            Text(title, style: textTheme.bodyMedium),
            const Spacer(),
            Text(style: textTheme.bodyLarge, ConstStrings.homeScreenleperLink),
            const SizedBox(width: 10),
            Icon(Iconsax.arrow_circle_left, color: scheme.secondary),
          ],
        ),
      ),
    );
  }
}

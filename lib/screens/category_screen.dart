import 'package:apple_store/core/utils/const_colors.dart';
import 'package:apple_store/core/utils/const_strings.dart';
import 'package:apple_store/screens/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return CustomScrollView(
      slivers: [
        _buildCategoryScreenAppbarWidget(textTheme),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        _buildCategoryScreenGridviewWidget(size),
      ],
    );
  }

  Widget _buildCategoryScreenAppbarWidget(textTheme) {
    return AppbarWidget(
      startWidget: const Icon(
        Icons.apple,
        color: ConstColors.materialWhite,
        size: 32,
      ),
      centerWidget: Expanded(
        child: Text(
          textAlign: TextAlign.center,
          ConstStrings.homeScreenCategoryTitle,
          style: textTheme.headlineSmall,
        ),
      ),
      endWidget: const Icon(
        Icons.apple,
        color: ConstColors.materialBlue,
        size: 32,
      ),
    );
  }

  Widget _buildCategoryScreenGridviewWidget(size) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: size.width * 0.1),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          mainAxisExtent: 150,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ColoredBox(
              color: Colors.redAccent,
              child: Image.asset(
                fit: BoxFit.cover,
                'assets/images/cat$index.jpg',
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:apple_store/core/utils/const_colors.dart';
import 'package:apple_store/core/utils/const_strings.dart';
import 'package:apple_store/screens/widgets/appbar_widget.dart';
import 'package:apple_store/screens/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CustomScrollView(
            slivers: [
              _buildProductScreenAppbarWidget(size, scheme, textTheme),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              _buildProductScreenGridviewWidget(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductScreenGridviewWidget(size) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: size.width * 0.1),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          mainAxisExtent: 216,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const ProductItemWidget();
        },
      ),
    );
  }

  Widget _buildProductScreenAppbarWidget(size, scheme, textTheme) {
    return AppbarWidget(
      startWidget: Icon(
        Iconsax.arrow_circle_right,
        color: scheme.onSurface,
        size: 28,
      ),
      centerWidget: Expanded(
        child: Text(
          textAlign: TextAlign.center,
          ConstStrings.homeScreenMostVieweds,
          style: textTheme.headlineSmall,
        ),
      ),
      endWidget: Icon(Iconsax.filter, color: scheme.onSurface, size: 28),
    );
  }
}

import 'package:apple_store/core/utils/category_model.dart';
import 'package:apple_store/core/utils/const_strings.dart';
import 'package:apple_store/screens/widgets/appbar_widget.dart';
import 'package:apple_store/screens/widgets/banner_item_widget.dart';
import 'package:apple_store/screens/widgets/category_item_widget.dart';
import 'package:apple_store/screens/widgets/helper_link_widget.dart';
import 'package:apple_store/screens/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO move controller to state manager
    final PageController bannerController = PageController(
      viewportFraction: 0.85,
    );
    final size = MediaQuery.of(context).size;
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: CustomScrollView(
        slivers: [
          _buildHomeScreenSearchWidget(textTheme, scheme, size),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          _buildHomeScreenBannerWidget(size, bannerController, scheme),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          _buildHomeScreenCategoryListWidget(textTheme, size),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          const HelperLinkWidget(title: ConstStrings.homeScreenBestSellers),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          _buildHomeScreenProductListWidget(size),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          const HelperLinkWidget(title: ConstStrings.homeScreenMostVieweds),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          _buildHomeScreenProductListWidget(size),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          const HelperLinkWidget(title: ConstStrings.homeScreenMostVieweds),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          _buildHomeScreenProductListWidget(size),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }

  Widget _buildHomeScreenSearchWidget(textTheme, scheme, size) {
    return AppbarWidget(
      startWidget: Icon(
        Iconsax.search_normal_1,
        size: size.height * 0.028,
        color: scheme.onSurface,
      ),
      centerWidget: Expanded(
        child: TextField(
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall,
          decoration: InputDecoration(
            hintText: ConstStrings.homeScreenSearchHint,
            hintStyle: textTheme.headlineSmall,
          ),
        ),
      ),
      endWidget: Icon(Icons.apple, color: scheme.secondary, size: 32),
    );
  }

  Widget _buildHomeScreenBannerWidget(size, bannerController, scheme) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: size.height * 0.195,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: bannerController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return BannerItemWidget(index: index);
              },
            ),
            Align(
              alignment: const Alignment(0, 0.9),
              child: SmoothPageIndicator(
                controller: bannerController,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotHeight: 5.0,
                  dotWidth: 5.0,
                  expansionFactor: 4.0,
                  dotColor: scheme.surface,
                  activeDotColor: scheme.secondary,
                ),
                onDotClicked: (index) {
                  bannerController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeScreenCategoryListWidget(textTheme, size) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.1),
            child: Text(
              style: textTheme.bodyMedium,
              ConstStrings.homeScreenCategoryTitle,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: size.height * 0.09,
            width: double.infinity,
            child: ListView.builder(
              itemCount: CategoryModel.categories.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(right: size.width * 0.1),
              itemBuilder: (context, index) {
                final CategoryModel category = CategoryModel.categories[index];
                return CategoryItemWidget(category: category);
              },
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHomeScreenProductListWidget(size) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: size.height * 0.248,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(right: size.width * 0.1),
          itemBuilder: (context, index) {
            return const ProductItemWidget();
          },
        ),
      ),
    );
  }
}

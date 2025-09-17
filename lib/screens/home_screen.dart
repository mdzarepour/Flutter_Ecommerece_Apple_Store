import 'package:apple_store/core/utils/category_model.dart';
import 'package:apple_store/core/utils/const_colors.dart';
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
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: CustomScrollView(
        slivers: [
          _buildHomeScreenSearchWidget(textTheme),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          _buildHomeScreenBannerWidget(bannerController),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          _buildHomeScreenCategoryTitleWidget(size, textTheme),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          _buildHomeScreenCategoryListWidget(textTheme, size),
          const HelperLinkWidget(title: ConstStrings.homeScreenBestSellers),
          _buildHomeScreenProductListWidget(size),
          const HelperLinkWidget(title: ConstStrings.homeScreenMostVieweds),
          _buildHomeScreenProductListWidget(size),
          const HelperLinkWidget(title: ConstStrings.homeScreenMostVieweds),
          _buildHomeScreenProductListWidget(size),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildHomeScreenSearchWidget(textTheme) {
    return AppbarWidget(
      startWidget: const Icon(
        Iconsax.search_normal_1,
        size: 25,
        color: ConstColors.materialBlack,
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
      endWidget: const Icon(
        Icons.apple,
        color: ConstColors.materialBlue,
        size: 32,
      ),
    );
  }

  Widget _buildHomeScreenBannerWidget(bannerController) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 170,
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
                effect: const ExpandingDotsEffect(
                  dotHeight: 5.0,
                  dotWidth: 5.0,
                  expansionFactor: 4.0,
                  dotColor: ConstColors.materialWhite,
                  activeDotColor: ConstColors.materialBlue,
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

  SliverToBoxAdapter _buildHomeScreenCategoryTitleWidget(size, textTheme) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(right: size.width * 0.1),
        child: Text(
          style: textTheme.bodyMedium,
          ConstStrings.homeScreenCategoryTitle,
        ),
      ),
    );
  }

  Widget _buildHomeScreenCategoryListWidget(textTheme, size) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 82,
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
    );
  }

  SliverToBoxAdapter _buildHomeScreenProductListWidget(size) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 216,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(right: size.width * 0.1),
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(left: 20),
              child: ProductItemWidget(),
            );
          },
        ),
      ),
    );
  }
}

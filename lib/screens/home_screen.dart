import 'package:apple_store/core/utils/category_model.dart';
import 'package:apple_store/core/utils/const_strings.dart';
import 'package:apple_store/screens/widgets/appbar_widget.dart';
import 'package:apple_store/screens/widgets/banner_item_widget.dart';
import 'package:apple_store/screens/widgets/category_item_widget.dart';
import 'package:apple_store/screens/widgets/helper_link_widget.dart';
import 'package:apple_store/screens/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    //TODO move controller to state manager
    final PageController bannerController = PageController(
      viewportFraction: 0.86,
    );
    final size = MediaQuery.of(context).size;
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: size.height * 0.023)),
              _buildHomeScreenSearchWidget(textTheme),
              SliverToBoxAdapter(child: SizedBox(height: size.height * 0.035)),
              _buildHomeScreenBannerWidget(size, bannerController, scheme),
              SliverToBoxAdapter(child: SizedBox(height: size.height * 0.035)),
              _buildHomeScreenCategoryListWidget(textTheme, size),
              SliverToBoxAdapter(child: SizedBox(height: size.height * 0.035)),
              HelperLinkWidget(title: ConstStrings.homeScreenBestSellers),
              SliverToBoxAdapter(child: SizedBox(height: size.height * 0.023)),
              _buildHomeScreenProductListWidget(size),
              SliverToBoxAdapter(child: SizedBox(height: size.height * 0.035)),
              HelperLinkWidget(title: ConstStrings.homeScreenMostVieweds),
              SliverToBoxAdapter(child: SizedBox(height: size.height * 0.023)),
              _buildHomeScreenProductListWidget(size),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildHomeScreenProductListWidget(Size size) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: size.height * 0.255,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(right: 44),
          itemBuilder: (context, index) {
            return ProductItemWidget();
          },
        ),
      ),
    );
  }

  Widget _buildHomeScreenSearchWidget(textTheme) {
    return AppbarWidget(
      startWidget: SvgPicture.asset('assets/icons/search.svg'),
      centerWidget: TextField(
        style: textTheme.headlineSmall,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 2, right: 5),
          hintText: ConstStrings.homeScreenSearchHint,
          hintStyle: textTheme.headlineSmall,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
      endWidget: SvgPicture.asset('assets/icons/apple.svg'),
    );
  }

  Widget _buildHomeScreenBannerWidget(
    Size size,
    PageController bannerController,
    ColorScheme scheme,
  ) {
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
              alignment: Alignment(0, 0.9),
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

  Widget _buildHomeScreenCategoryListWidget(textTheme, Size size) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Text(
              style: textTheme.bodyMedium,
              ConstStrings.homeScreenCategoryTitle,
            ),
          ),
          SizedBox(height: size.height * 0.023),
          SizedBox(
            height: size.height * 0.09,
            width: double.infinity,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 40),
              itemCount: CategoryModel.categories.length,
              scrollDirection: Axis.horizontal,
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
}

import 'package:apple_store/core/utils/category_model.dart';
import 'package:apple_store/core/utils/const_strings.dart';
import 'package:apple_store/screens/widgets/banner_item_widget.dart';
import 'package:apple_store/screens/widgets/category_item_widget.dart';
import 'package:apple_store/screens/widgets/helper_link_widget.dart';
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
              SliverToBoxAdapter(child: SizedBox(height: size.height * 0.025)),
              _buildHomeScreenSearchWidget(size, scheme, textTheme),
              SliverToBoxAdapter(child: SizedBox(height: size.height * 0.035)),
              _buildHomeScreenBannerWidget(size, bannerController, scheme),
              SliverToBoxAdapter(child: SizedBox(height: size.height * 0.035)),
              _buildHomeScreenCategoryListWidget(textTheme, size),
              SliverToBoxAdapter(child: SizedBox(height: size.height * 0.035)),
              HelperLinkWidget(title: ConstStrings.homeScreenBestSellers),

              SliverFillRemaining(),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar _buildHomeScreenSearchWidget(
    Size size,
    ColorScheme scheme,
    TextTheme textTheme,
  ) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: scheme.surface,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: size.height * 0.05,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
            color: scheme.onSecondary,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/search.svg'),
              Expanded(
                child: TextField(
                  style: textTheme.headlineSmall,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 2, right: 5),
                    hintText: ConstStrings.homeScreenSearchHint,
                    hintStyle: textTheme.headlineSmall,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              SvgPicture.asset('assets/icons/apple.svg'),
            ],
          ),
        ),
      ),
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
          SizedBox(height: 20),
          SizedBox(
            height: size.height * 0.1,
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

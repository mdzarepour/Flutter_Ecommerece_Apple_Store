import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO ====> move banner controller to statemanager class
    final PageController bannerController = PageController(
      viewportFraction: 0.86,
    );
    final size = MediaQuery.of(context).size;
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.205,
      child: Stack(
        children: [
          PageView.builder(
            controller: bannerController,
            // TODO =====> get count dynamicaly
            itemCount: 3,
            itemBuilder: (context, index) {
              return _BannerItemWidget(imagePathIndex: index);
            },
          ),
          Align(
            alignment: Alignment(0, 0.90),
            child: SmoothPageIndicator(
              controller: bannerController,
              onDotClicked: (index) {
                bannerController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 7,
                dotWidth: 7,
                expansionFactor: 5,
                dotColor: scheme.surface,
                activeDotColor: scheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BannerItemWidget extends StatelessWidget {
  final int imagePathIndex;
  const _BannerItemWidget({required this.imagePathIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        imagePathIndex == 0 ? 0 : 10,
        0,
        imagePathIndex == 2 ? 0 : 10,
        0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/banner$imagePathIndex.jpg'),
        ),
      ),
    );
  }
}

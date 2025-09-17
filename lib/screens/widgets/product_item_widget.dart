import 'package:apple_store/core/utils/const_colors.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: 160,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _productItemUpperSection(textTheme),
            _productItemBottomSection(textTheme, size),
          ],
        ),
      ),
    );
  }

  Expanded _productItemUpperSection(textTheme) {
    return Expanded(
      flex: 6,
      child: ColoredBox(
        color: ConstColors.materialWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Expanded(
              flex: 6,
              child: Stack(
                children: [
                  Center(child: Image.asset('assets/images/product0.png')),
                  const Positioned(
                    top: 0,
                    right: 10,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: ConstColors.materialBlue,
                      child: Icon(
                        Icons.favorite,
                        size: 13,
                        color: ConstColors.materialWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 0,
                    child: Container(
                      width: 25,
                      height: 15,
                      decoration: BoxDecoration(
                        color: ConstColors.materialRed,
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                      child: Center(
                        child: Text(style: textTheme.labelLarge, '%۳'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 1,
              child: Text(
                textAlign: TextAlign.center,
                style: textTheme.displaySmall,
                'آیفون ۱۳ پرومکس',
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Expanded _productItemBottomSection(textTheme, size) {
    return Expanded(
      flex: 2,
      child: ColoredBox(
        color: ConstColors.materialBlue,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 2,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: ConstColors.materialWhite,
                  child: Icon(
                    Icons.arrow_back,
                    size: 15,
                    color: ConstColors.materialBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 2,
                  children: [
                    Text(
                      textDirection: TextDirection.ltr,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: textTheme.displayLarge,
                      '۴۶٬۰۰۰٬۰۰۰',
                    ),
                    Text(
                      textDirection: TextDirection.ltr,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: textTheme.displayMedium,
                      '۴۵٬۳۵۰٬۰۰۰',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: Text(style: textTheme.displayLarge, 'تومان'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

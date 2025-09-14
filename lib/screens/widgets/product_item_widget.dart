import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: SizedBox(
        height: double.infinity,
        width: 160,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _productItemUpperSection(scheme, textTheme),
              _productItemBottomSection(scheme, textTheme),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _productItemUpperSection(ColorScheme scheme, TextTheme textTheme) {
    return Expanded(
      flex: 6,
      child: ColoredBox(
        color: scheme.onSecondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            SizedBox(width: double.infinity),
            Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 10,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: scheme.secondary,
                    child: Icon(
                      Icons.favorite,
                      size: 13,
                      color: scheme.onSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(child: Image.asset('assets/images/product.png')),
                Positioned(
                  left: 10,
                  bottom: 0,
                  child: Container(
                    width: 25,
                    height: 15,
                    decoration: BoxDecoration(
                      color: scheme.errorContainer,
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: Center(
                      child: Text(style: textTheme.labelLarge, '%۳'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              style: textTheme.displaySmall,
              'آیفون ۱۳ پرومکس',
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Expanded _productItemBottomSection(scheme, textTheme) {
    return Expanded(
      flex: 2,
      child: ColoredBox(
        color: scheme.secondary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: scheme.onSecondary,
                  child: Icon(
                    Icons.arrow_back,
                    size: 15,
                    color: scheme.secondary,
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
              SizedBox(width: 5),
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

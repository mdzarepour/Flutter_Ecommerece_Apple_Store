import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.38,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _productItemUpperSection(scheme, textTheme, size),
            _productItemBottomSection(scheme, textTheme, size),
          ],
        ),
      ),
    );
  }

  Expanded _productItemUpperSection(scheme, textTheme, size) {
    return Expanded(
      flex: 6,
      child: ColoredBox(
        color: scheme.onSecondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Expanded(
              flex: 6,
              child: Stack(
                children: [
                  Center(child: Image.asset('assets/images/product.jpg')),
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
                  Positioned(
                    left: 10,
                    bottom: 0,
                    child: Container(
                      width: size.width * 0.06,
                      height: size.height * 0.017,
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

  Expanded _productItemBottomSection(scheme, textTheme, size) {
    return Expanded(
      flex: 2,
      child: ColoredBox(
        color: scheme.secondary,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
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

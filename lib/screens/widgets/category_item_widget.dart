import 'package:apple_store/core/utils/category_model.dart';
import 'package:apple_store/core/utils/const_colors.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryModel category;
  const CategoryItemWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: ShapeDecoration(
              color: category.color,
              shadows: [
                BoxShadow(
                  color: category.color.withAlpha(25),
                  spreadRadius: 0.5,
                  blurRadius: 5.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(40.0),
              ),
            ),
            child: Icon(
              category.icon,
              color: ConstColors.materialWhite,
              size: 26,
            ),
          ),
          const Spacer(),
          Text(style: textTheme.bodySmall, category.title),
        ],
      ),
    );
  }
}

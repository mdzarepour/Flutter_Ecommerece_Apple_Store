import 'package:apple_store/core/utils/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CategoryModel {
  final String title;
  final Color color;
  final IconData icon;

  CategoryModel({required this.color, required this.title, required this.icon});

  static final List categories = [
    CategoryModel(
      color: ConstColors.materialSoftBlue,
      title: 'همه',
      icon: Icons.ads_click_outlined,
    ),
    CategoryModel(
      color: ConstColors.materialOrange,
      title: 'آیفون',
      icon: Iconsax.mobile,
    ),
    CategoryModel(
      color: ConstColors.materialDarkGrey,
      title: 'مک بوک',
      icon: Icons.laptop_mac,
    ),
    CategoryModel(
      color: ConstColors.materialGreen,
      title: 'اپل واچ',
      icon: Iconsax.watch,
    ),
    CategoryModel(
      color: ConstColors.materialPurple,
      title: 'آی مک',
      icon: Iconsax.monitor,
    ),
    CategoryModel(
      color: ConstColors.materialPink,
      title: 'ایرپاد',
      icon: Iconsax.airpods,
    ),
  ];
}

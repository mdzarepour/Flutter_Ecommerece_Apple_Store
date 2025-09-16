import 'package:flutter/material.dart';

class BannerItemWidget extends StatelessWidget {
  final int index;
  const BannerItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/banner$index.jpg'),
          ),
        ),
      ),
    );
  }
}

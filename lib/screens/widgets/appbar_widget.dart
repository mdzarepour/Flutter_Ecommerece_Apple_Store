import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  final Widget startWidget;
  final Widget centerWidget;
  final Widget endWidget;

  const AppbarWidget({
    super.key,
    required this.centerWidget,
    required this.endWidget,
    required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
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
              startWidget,
              Expanded(child: centerWidget),
              endWidget,
            ],
          ),
        ),
      ),
    );
  }
}

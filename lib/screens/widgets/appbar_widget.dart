import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  final Widget? startWidget;
  final Widget? centerWidget;
  final Widget? endWidget;

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
      toolbarHeight: size.height * 0.070,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: 8,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
            color: scheme.onSecondary,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [?startWidget, ?centerWidget, ?endWidget],
          ),
        ),
      ),
    );
  }
}

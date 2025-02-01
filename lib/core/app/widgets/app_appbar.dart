import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/core/app/theme/theme.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar(
      {super.key,
      required this.appBarText,
      required this.height,
      required this.back,
      required this.color});
  final String appBarText;
  final double height;
  final bool back;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: color,
        surfaceTintColor: color,
        centerTitle: true,
        title: Transform.translate(
            offset: Offset(0, 3),
            child: Text(
              appBarText,
              style: theme.textTheme.labelLarge,
            )),
        leading: back
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.go('/news'),
              )
            : null);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

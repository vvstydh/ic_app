import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/core/app/theme/theme.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar(
      {super.key,
      required this.appBarText,
      required this.height,
      required this.back});
  final String appBarText;
  final double height;
  final bool back;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: theme.colorScheme.primary,
        surfaceTintColor: theme.colorScheme.primary,
        centerTitle: true,
        title: Text(
          appBarText,
          style: theme.textTheme.labelLarge,
        ),
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

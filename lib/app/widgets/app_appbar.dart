import 'package:flutter/material.dart';
import 'package:ic_app/app/theme/theme.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar({super.key, required this.appBarText, required this.height});
  final String appBarText;
  final double height;

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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

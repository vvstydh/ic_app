import 'package:flutter/material.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/app_appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: theme.colorScheme.primary,
      appBar: const AppAppbar(
        appBarText: 'Профиль',
        height: 40,
        back: false,
      ),
    );
  }
}

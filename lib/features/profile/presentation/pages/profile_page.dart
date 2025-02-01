import 'package:flutter/material.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/app_appbar.dart';
import 'package:ic_app/features/profile/domain/user_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.userData});
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: AppAppbar(
        appBarText: 'Профиль',
        height: 40,
        back: false,
        color: theme.colorScheme.primary,
      ),
      body: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.secondary),
          onPressed: () {
            userData.signOut();
          },
          child: Transform.translate(
            offset: Offset(0, 3),
            child: Text(
              'Exit',
              style: theme.textTheme.bodyMedium,
            ),
          )),
    );
  }
}

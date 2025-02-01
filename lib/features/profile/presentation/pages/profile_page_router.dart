import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ic_app/features/profile/domain/user_data.dart';
import 'package:ic_app/features/profile/presentation/pages/authentification_page.dart';
import 'package:ic_app/features/profile/presentation/pages/profile_page.dart';

class ProfilePageRouter extends StatelessWidget {
  const ProfilePageRouter({super.key, required this.userData});
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => userData.user == null
            ? AuthentificationPage(userData: userData)
            : ProfilePage(
                userData: userData,
              ));
  }
}

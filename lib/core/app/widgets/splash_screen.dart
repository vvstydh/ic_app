import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/features/profile/domain/user_data.dart';

class GoRouterSplashScreen extends StatefulWidget {
  const GoRouterSplashScreen({super.key, required this.userData});
  final UserData userData;

  @override
  State<GoRouterSplashScreen> createState() =>
      // ignore: no_logic_in_create_state
      _GoRouterSplashScreenState(userData);
}

class _GoRouterSplashScreenState extends State<GoRouterSplashScreen> {
  data(BuildContext context) {}
  _GoRouterSplashScreenState(this._userData);
  final UserData _userData;

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.gif(
      gifPath: 'assets/images/splash.gif',
      gifWidth: 250,
      gifHeight: 250,
      backgroundColor: Colors.white,
      asyncNavigationCallback: () async {
        await Future.delayed(const Duration(seconds: 6));
        if (_userData.user == null) {
          // ignore: use_build_context_synchronously
          context.replace('/authentication');
        } else if (context.mounted) {
          context.replace('/news');
        }
      },
    );
  }
}

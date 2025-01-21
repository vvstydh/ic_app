import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/app/theme/theme.dart';

class GoRouterSplashScreen extends StatefulWidget {
  const GoRouterSplashScreen({super.key});

  @override
  State<GoRouterSplashScreen> createState() => _GoRouterSplashScreenState();
}

class _GoRouterSplashScreenState extends State<GoRouterSplashScreen> {
  data(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: theme.colorScheme.primary,
      childWidget: SizedBox(
        height: 250,
        width: 250,
        child: Image.asset("assets/images/splash.png"),
      ),
      asyncNavigationCallback: () async {
        await Future.delayed(const Duration(seconds: 3));
        if (context.mounted) {
          context.replace('/news');
        }
      },
    );
  }
}

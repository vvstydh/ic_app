import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/features/news/domain/news_list.dart';

class GoRouterSplashScreen extends StatefulWidget {
  const GoRouterSplashScreen({super.key});

  @override
  State<GoRouterSplashScreen> createState() => _GoRouterSplashScreenState();
}

class _GoRouterSplashScreenState extends State<GoRouterSplashScreen> {
  data(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.gif(
      gifPath: 'assets/images/splash.gif',
      gifWidth: 250,
      gifHeight: 250,
      backgroundColor: Colors.white,
      asyncNavigationCallback: () async {
        await Future.delayed(const Duration(seconds: 6));
        if (context.mounted) {
          context.replace('/news');
        }
      },
    );
  }
}

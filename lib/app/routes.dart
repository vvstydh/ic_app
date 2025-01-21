import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/app/navigation_bar.dart';
import 'package:ic_app/app/theme/theme.dart';
import 'package:ic_app/app/widgets/splash_screen.dart';
import 'package:ic_app/features/news/presentation/pages/news_page.dart';
import 'package:ic_app/features/profile/presentation/pages/profile_page.dart';
import 'package:ic_app/features/tests/presentation/pages/test_page.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const GoRouterSplashScreen();
          },
        ),
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                NavigationBarRouter(navigationShell: navigationShell),
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                      path: '/news', builder: (context, state) => NewsPage()),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/tests',
                    builder: (context, state) => const TestPage(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/prifile',
                    builder: (context, state) => const ProfilePage(),
                  ),
                ],
              ),
            ])
      ],
    );

    return MaterialApp.router(
      routerConfig: router,
      theme: theme,
      debugShowCheckedModeBanner: false,
    );
  }
}

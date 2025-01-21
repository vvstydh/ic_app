import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/core/app/widgets/navigation_bar.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/splash_screen.dart';
import 'package:ic_app/features/news/domain/news_list.dart';
import 'package:ic_app/features/news/presentation/pages/content_page.dart';
import 'package:ic_app/features/news/presentation/pages/news_page.dart';
import 'package:ic_app/features/profile/presentation/pages/profile_page.dart';
import 'package:ic_app/features/tests/presentation/pages/test_page.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    final newsList = NewsList();

    newsList.getNewsList();

    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const GoRouterSplashScreen();
          },
        ),
        GoRoute(
          path: '/content',
          builder: (context, state) => ContentPage(
            newsList: newsList,
            index: state.extra as int,
          ),
        ),
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                NavigationBarRouter(navigationShell: navigationShell),
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                      path: '/news',
                      builder: (context, state) => NewsPage(
                            newsList: newsList,
                          )),
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
                    path: '/profile',
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

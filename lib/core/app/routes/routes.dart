import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/core/app/widgets/navigation_bar.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/splash_screen.dart';
import 'package:ic_app/features/diary/domain/hour_theme.dart';
import 'package:ic_app/features/diary/presentation/pages/curatorial_hours_page.dart';
import 'package:ic_app/features/news/domain/news_list.dart';
import 'package:ic_app/features/news/presentation/pages/content_page.dart';
import 'package:ic_app/features/news/presentation/pages/news_page.dart';
import 'package:ic_app/features/profile/domain/user_data.dart';
import 'package:ic_app/features/profile/presentation/pages/authentication_page.dart';
import 'package:ic_app/features/profile/presentation/pages/profile_page.dart';
import 'package:ic_app/features/diary/presentation/pages/diary_page.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    final newsList = NewsList();
    final userData = UserData();
    final hourThemes = HourTheme();

    newsList.getNewsList();
    userData.userCheck();
    hourThemes.getThemeList();
    if (userData.user != null) {
      userData.getUserData();
    }

    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return GoRouterSplashScreen(
              userData: userData,
            );
          },
        ),
        GoRoute(
          path: '/content',
          builder: (context, state) => ContentPage(
            newsList: newsList,
            index: state.extra as int,
          ),
        ),
        GoRoute(
            path: '/authentication',
            builder: (context, state) => AuthenticationPage(
                  userData: userData,
                )),
        GoRoute(
            path: '/curatorial_hours',
            builder: (context, state) => CuratorialHoursPage(
                  groupNumber: state.extra as String,
                  themes: hourThemes,
                )),
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
                    path: '/diary',
                    builder: (context, state) => DiaryPage(
                      userData: userData,
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/profile',
                    builder: (context, state) => ProfilePage(
                      userData: userData,
                    ),
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

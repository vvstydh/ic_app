import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/app/theme/theme.dart';

class NavigationBarRouter extends StatelessWidget {
  const NavigationBarRouter({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: navigationShell,
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 30),
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomNavigationBar(
            elevation: 30,
            borderRadius: const Radius.circular(45),
            selectedColor: theme.colorScheme.secondary,
            backgroundColor: theme.colorScheme.primary,
            strokeColor: theme.colorScheme.secondary,
            unSelectedColor: theme.colorScheme.tertiary,
            items: [
              CustomNavigationBarItem(
                icon: const Icon(
                  Icons.newspaper_rounded,
                ),
                title: Text(
                  'Новости',
                  style: theme.textTheme.labelMedium,
                ),
                selectedTitle: Text(
                  'Новости',
                  style: theme.textTheme.labelMedium,
                ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.analytics_rounded),
                title: Text(
                  'Тесты',
                  style: theme.textTheme.labelMedium,
                ),
                selectedTitle: Text(
                  'Тесты',
                  style: theme.textTheme.labelMedium,
                ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.face_6_rounded),
                title: Text(
                  'Профиль',
                  style: theme.textTheme.labelMedium,
                ),
                selectedTitle: Text(
                  'Профиль',
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ],
            currentIndex: navigationShell.currentIndex,
            onTap: (index) => navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            ),
          ),
        ));
  }
}

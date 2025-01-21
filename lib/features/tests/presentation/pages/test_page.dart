import 'package:flutter/material.dart';
import 'package:ic_app/app/theme/theme.dart';
import 'package:ic_app/app/widgets/app_appbar.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: theme.colorScheme.primary,
      appBar: const AppAppbar(appBarText: 'Тесты', height: 40),
    );
  }
}

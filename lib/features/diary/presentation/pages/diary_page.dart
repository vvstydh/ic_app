import 'package:flutter/material.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/app_appbar.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: theme.colorScheme.primary,
      appBar: AppAppbar(
        appBarText: 'Дневник',
        height: 40,
        back: false,
        color: theme.colorScheme.primary,
      ),
    );
  }
}

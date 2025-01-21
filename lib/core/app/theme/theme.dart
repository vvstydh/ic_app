import 'package:flutter/material.dart';

final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: const Color.fromARGB(255, 255, 250, 246),
      secondary: const Color.fromARGB(255, 0, 0, 0),
      tertiary: const Color.fromARGB(255, 204, 204, 204),
      onTertiary: const Color.fromARGB(255, 109, 109, 109),
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
          fontFamily: 'BebasNeue', fontWeight: FontWeight.bold, fontSize: 25),
      labelMedium: TextStyle(
          fontFamily: 'BebasNeue', fontWeight: FontWeight.bold, fontSize: 18),
      labelSmall: TextStyle(
          fontFamily: 'BebasNeue', fontWeight: FontWeight.bold, fontSize: 15),
    ));

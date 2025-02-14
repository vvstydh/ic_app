import 'package:flutter/material.dart';

final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 0, 0, 0),
      primary: const Color.fromARGB(255, 255, 250, 246),
      secondary: const Color.fromARGB(255, 0, 0, 0),
      tertiary: const Color.fromARGB(255, 232, 232, 232),
      onTertiary: const Color.fromARGB(255, 109, 109, 109),
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
          fontFamily: 'BebasNeue', fontWeight: FontWeight.bold, fontSize: 25),
      labelMedium: TextStyle(
          fontFamily: 'BebasNeue', fontWeight: FontWeight.bold, fontSize: 18),
      labelSmall: TextStyle(
          fontFamily: 'BebasNeue', fontWeight: FontWeight.bold, fontSize: 15),
      bodyLarge: TextStyle(
          fontFamily: 'BebasNeue', fontWeight: FontWeight.bold, fontSize: 35),
      bodyMedium: TextStyle(
        fontFamily: 'BebasNeue',
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Color.fromARGB(255, 255, 250, 246),
      ),
      displayMedium: TextStyle(
        fontFamily: 'BebasNeue',
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Color.fromARGB(255, 109, 109, 109),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color.fromARGB(255, 0, 0, 0),
      selectionHandleColor: Color.fromARGB(255, 0, 0, 0),
    ));

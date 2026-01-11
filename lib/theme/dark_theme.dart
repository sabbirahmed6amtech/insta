import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: const Color(0xFFFFFFFF),
    scaffoldBackgroundColor: const Color(0xFF000000),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF000000),
      elevation: 0.5,
      iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFFFFFFFF),
      secondary: const Color(0xFF0095F6),
      surface: const Color(0xFF121212),
      error: const Color(0xFFED4956),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Color(0xFFFFFFFF),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFFE4E6EB),
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: Color(0xFFB0B3B8),
      ),
    ),
  );
}

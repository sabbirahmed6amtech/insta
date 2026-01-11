import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: const Color(0xFF000000),
    scaffoldBackgroundColor: const Color(0xFFFAFAFA),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFAFAFA),
      elevation: 0.5,
      iconTheme: IconThemeData(color: Color(0xFF000000)),
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Color(0xFF000000),
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF000000),
      secondary: const Color(0xFF0095F6),
      surface: const Color(0xFFFAFAFA),
      error: const Color(0xFFED4956),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF000000),
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFF000000),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Color(0xFF000000),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFF262626),
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: Color(0xFF65676B),
      ),
    ),
  );
}

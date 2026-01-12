import 'package:flutter/material.dart';

// Custom theme extension for Instagram-specific colors
class InstaColors extends ThemeExtension<InstaColors> {
  final Color gradientPurple;
  final Color gradientOrange;
  final Color gradientYellow;
  final Color heartRed;

  const InstaColors({
    required this.gradientPurple,
    required this.gradientOrange,
    required this.gradientYellow,
    required this.heartRed,
  });

  @override
  InstaColors copyWith({
    Color? gradientPurple,
    Color? gradientOrange,
    Color? gradientYellow,
    Color? heartRed,
  }) {
    return InstaColors(
      gradientPurple: gradientPurple ?? this.gradientPurple,
      gradientOrange: gradientOrange ?? this.gradientOrange,
      gradientYellow: gradientYellow ?? this.gradientYellow,
      heartRed: heartRed ?? this.heartRed,
    );
  }

  @override
  InstaColors lerp(ThemeExtension<InstaColors>? other, double t) {
    if (other is! InstaColors) return this;
    return InstaColors(
      gradientPurple: Color.lerp(gradientPurple, other.gradientPurple, t)!,
      gradientOrange: Color.lerp(gradientOrange, other.gradientOrange, t)!,
      gradientYellow: Color.lerp(gradientYellow, other.gradientYellow, t)!,
      heartRed: Color.lerp(heartRed, other.heartRed, t)!,
    );
  }
}

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
      tertiary: const Color(0xFF8E8E8E),
      surface: const Color(0xFFFFFFFF),
      error: const Color(0xFFED4956),
      onPrimary: const Color(0xFFFFFFFF),
      onSecondary: const Color(0xFFFFFFFF),
      onSurface: const Color(0xFF000000),
      onError: const Color(0xFFFFFFFF),
      outline: const Color(0xFFDBDBDB),
    ),
    dividerColor: const Color(0xFFDBDBDB),
    iconTheme: const IconThemeData(
      color: Color(0xFF262626),
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
        color: Color(0xFF8E8E8E),
      ),
    ),
    extensions: const [
      InstaColors(
        gradientPurple: Color(0xFFC13584),
        gradientOrange: Color(0xFFF77737),
        gradientYellow: Color(0xFFFCCC63),
        heartRed: Color(0xFFED4956),
      ),
    ],
  );
}

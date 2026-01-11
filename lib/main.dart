import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme/llight_theme.dart';
import 'theme/dark_theme.dart';
import 'feature/splash/view/splash_screen.dart';
import 'feature/auth/view/login_screen.dart';
import 'feature/home/view/home_screen.dart';
import 'feature/profile/view/profile_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: DarkTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const SplashScreen(),
      getPages: [
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
      ],
    );
  }
}

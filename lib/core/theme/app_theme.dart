// lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryPurple = Color(0xFF6B4EFF);
  static const Color deepPurple = Color(0xFF4A2BFF);
  static const Color darkPurple = Color(0xFF2D1B69);
  static const Color neonBlue = Color(0xFF00D4FF);
  static const Color successGreen = Color(0xFF00E676);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryPurple,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

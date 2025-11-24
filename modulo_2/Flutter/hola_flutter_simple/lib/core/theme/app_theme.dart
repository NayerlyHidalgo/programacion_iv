import 'package:flutter/material.dart';

class AppTheme {
  static const bg = Color(0xFF0d1117);
  static const card = Color(0xFF161b22);
  static const text = Color(0xFFc9d1d9);
  static const primary = Color(0xFF58a6ff);
  static const accent = Color(0xFF2ea043);
  static const border = Color(0xFF30363d);

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.dark,
        primary: primary,
        secondary: accent,
        surface: card,
        outline: border,
      ),
      textTheme: const TextTheme(bodyMedium: TextStyle(color: text)),
      appBarTheme: const AppBarTheme(
        backgroundColor: card,
        foregroundColor: primary,
        elevation: 0,
      ),
      cardColor: card,
    );
  }
}
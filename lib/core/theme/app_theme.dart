import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3E4A61)),
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF4F5F7),
    );
  }
}

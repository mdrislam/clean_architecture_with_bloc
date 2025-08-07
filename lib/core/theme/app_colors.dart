import 'package:flutter/material.dart';

class AppColors {
  // Common Colors
  static const Color primary = Color.fromARGB(255, 115, 255, 120);
  static const Color white = Colors.white;
  static final Color grey400 = Colors.grey[400] as Color;
  static final Color transparent = Colors.transparent;

  // Light Theme Colors
  static const Color lightScaffoldBackground = Colors.white;
  static const Color lightAppBarBackground = Colors.white;
  static const Color lightAppBarForeground = Colors.black;
  static const Color lightIconColor = Colors.black87;
  static const Color lightInputFill = Color(0xFFF0F0F0);
  static const Color lightHintText = Color(0xFF999999);
  static const Color lightPrefixIcon = Color(0xFF777777);
  static const Color lightCardColor = Color(0xFFF5F5F5);

  // Dark Theme Colors
  static const Color darkScaffoldBackground = Color(0xFF121212);
  static const Color darkAppBarBackground = Color(0xFF121212);
  static const Color darkAppBarForeground = Colors.white;
  static const Color darkIconColor = Colors.white70;
  static const Color darkInputFill = Color(0xFF2C2C2C);
  static const Color darkHintText = Color(0xFFB0B0B0);
  static const Color darkPrefixIcon = Color(0xFFE0E0E0);
  static const Color darkCardColor = Color(0xFF2C2C2C);
}

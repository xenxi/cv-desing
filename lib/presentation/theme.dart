import 'package:flutter/material.dart';

class CustomTheme {
  static Color primaryColor = const Color.fromRGBO(194, 162, 126, 1);
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
        primaryColor: primaryColor,
        colorScheme: const ColorScheme.light().copyWith(
            primary: primaryColor,
            secondary: const Color.fromRGBO(35, 31, 32, 1)));
  }
}

import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light().copyWith(
            primary: const Color.fromRGBO(194, 162, 126, 1),
            secondary: const Color.fromRGBO(35, 31, 32, 1)));
  }
}

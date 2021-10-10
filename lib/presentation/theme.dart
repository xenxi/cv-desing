import 'package:flutter/material.dart';

class CustomTheme {
  static double defaultPadding = 20.0;
  static Color primaryColor = const Color.fromRGBO(194, 162, 126, 1);
  static Color secondaryColor = const Color.fromRGBO(35, 31, 32, 1);
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
        primaryColor: primaryColor,
        colorScheme: const ColorScheme.light()
            .copyWith(primary: primaryColor, secondary: secondaryColor));
  }
}

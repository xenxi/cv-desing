import 'package:flutter/material.dart';

class CustomTheme {
  static double navbarHeight = 100.0;
  static double defaultPadding = 20.0;
  static double defaultBorderRadius = 10.0;
  static Color primaryColor = const Color.fromRGBO(194, 162, 126, 1);
  static Color secondaryColor = const Color.fromRGBO(35, 31, 32, 1);

  static const Color primaryText1 = Color(0xFF959595);
  static const Color primaryText2 = Color(0xFF717171);

  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
        primaryColor: primaryColor,
        colorScheme: const ColorScheme.light()
            .copyWith(primary: primaryColor, secondary: secondaryColor));
  }
}

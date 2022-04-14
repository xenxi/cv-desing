import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static const List<Color> snowGradient = [
    Color.fromRGBO(255, 222, 242, 1),
    Color.fromRGBO(230, 240, 255, 1),
  ];
  static const List<Color> fireGradient = [
    Color.fromRGBO(255, 108, 135, 1),
    Color.fromRGBO(252, 114, 70, 1),
  ];
  static const List<Color> batmanGradient = [
    Color.fromRGBO(51, 51, 51, 1),
    Color.fromRGBO(18, 18, 18, 1),
  ];
  static const List<Color> peachyGradient = [
    Color.fromRGBO(255, 72, 182, 1),
    Color.fromRGBO(255, 126, 108, 1),
  ];
  static const List<Color> pastelGradient = [
    Color.fromRGBO(221, 149, 247, 1),
    Color.fromRGBO(154, 173, 249, 1),
    Color.fromRGBO(127, 201, 217, 1),
  ];
  static const List<Color> greenGradient = [
    Color.fromRGBO(135, 207, 142, 1),
    Color.fromRGBO(136, 207, 135, 1),
  ];
  static const List<Color> lemonGradient = [
    Color.fromRGBO(251, 205, 56, 1),
    Color.fromRGBO(252, 187, 91, 1),
  ];
  static const double navbarHeight = 100.0;
  static const double navbarMobileHeight = 60.0;
  static const double defaultPadding = 20.0;
  static const double defaultBorderRadius = 10.0;
  static const Color primaryColor = Color.fromRGBO(194, 162, 126, 1);
  static const Color secondaryColor = Color.fromRGBO(35, 31, 32, 1);
  static const Color errorColor = Color.fromRGBO(239, 71, 111, 1);
  static const Color successColor = Color.fromRGBO(138, 234, 146, 1);

  static const Color primaryText1 = Color(0xFF959595);
  static const Color primaryText2 = Color(0xFF717171);

  static const footerPadding = 80.0;
  static const paddingBigButton = 14.0;

  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      primaryColor: primaryColor,
      textTheme: _lightTextTheme,
      colorScheme: const ColorScheme.light()
          .copyWith(primary: primaryColor, secondary: secondaryColor),
    );
  }

  static final TextTheme _lightTextTheme = ThemeData.light().textTheme.copyWith(
        caption: GoogleFonts.ibmPlexMono(
          fontSize: 12,
          color: primaryText1,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      );
}

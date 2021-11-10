import 'package:flutter/material.dart';

double widthOfScreen(BuildContext context) => MediaQuery.of(context).size.width;
double heightOfScreen(BuildContext context) =>
    MediaQuery.of(context).size.height;

double assignHeight({
  required BuildContext context,
  required double fraction,
  double additions = 0,
  double subs = 0,
}) =>
    (heightOfScreen(context) - subs + additions) * fraction;

double assignWidth({
  required BuildContext context,
  required double fraction,
  double additions = 0,
  double subs = 0,
}) =>
    (widthOfScreen(context) - subs + additions) * fraction;

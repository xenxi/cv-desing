import 'package:flutter/material.dart';

Future<void> scrollToSection(
  BuildContext? context, {
  int durationInMillisecons = 600,
}) {
  return Scrollable.ensureVisible(
    context!,
    duration: Duration(milliseconds: durationInMillisecons),
  );
}

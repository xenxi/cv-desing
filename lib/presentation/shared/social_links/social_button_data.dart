import 'package:flutter/material.dart';

class SocialButtonData {
  final String tag;
  final void Function() onPressed;
  final IconData iconData;
  final Color? iconColor;
  final Color? borderColor;

  SocialButtonData({
    required this.tag,
    required this.iconData,
    required this.onPressed,
    this.iconColor,
    this.borderColor,
  });
}

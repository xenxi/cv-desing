import 'package:flutter/material.dart';

class SocialButtonData {
  SocialButtonData({
    required this.tag,
    required this.iconData,
    required this.onPressed,
    this.iconColor,
    this.borderColor,
  });

  final String tag;
  final void Function() onPressed;
  final IconData iconData;
  final Color? iconColor;
  final Color? borderColor;
}

import 'package:flutter/material.dart';

class SocialButtonData {
  final String tag;
  final String url;
  final IconData iconData;
  final Color? iconColor;
  final Color? borderColor;

  SocialButtonData({
    required this.tag,
    required this.iconData,
    required this.url,
    this.iconColor,
    this.borderColor,
  });
}

import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.tag,
    this.width = 28,
    this.elevation = 1,
    this.height = 28,
    required this.iconData,
    this.iconSize = 14,
    this.iconColor = Colors.black,
    this.buttonColor = Colors.white,
    this.decoration,
    this.onPressed,
  }) : super(key: key);

  final String tag;
  final double width;
  final double elevation;
  final double height;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final Color buttonColor;
  final BoxDecoration? decoration;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: FloatingActionButton(
        elevation: elevation,
        onPressed: onPressed,
        backgroundColor: buttonColor,
        heroTag: tag,
        child: Icon(
          iconData,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}

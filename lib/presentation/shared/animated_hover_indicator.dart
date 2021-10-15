import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:flutter/material.dart';

class AnimatedHoverIndicator extends StatelessWidget {
  const AnimatedHoverIndicator({
    Key? key,
    this.indicatorColor,
    required this.width,
    this.height = 6,
    this.curve = Curves.linearToEaseOut,
    this.duration = const Duration(milliseconds: 300),
    this.isHover = false,
  }) : super(key: key);

  final Color? indicatorColor;
  final double width;
  final double height;
  final Curve curve;
  final Duration duration;
  final bool isHover;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isHover ? width : 0,
      height: height,
      color: indicatorColor ?? CustomTheme.primaryColor,
      duration: duration,
      curve: curve,
    );
  }
}

import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:flutter/material.dart';

class SelectedIndicator extends StatelessWidget {
  const SelectedIndicator({
    Key? key,
    this.indicatorColor,
    required this.width,
    this.height = 6,
    this.opacity = 0.85,
  }) : super(key: key);

  final Color? indicatorColor;
  final double width;
  final double height;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: width,
        height: height,
        color: indicatorColor ?? CustomTheme.primaryColor,
      ),
    );
  }
}

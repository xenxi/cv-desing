import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';

class Section extends StatelessWidget {
  final Widget child;
  final BoxDecoration? decoration;
  final bool expandable;
  const Section({
    Key? key,
    required this.child,
    this.decoration,
    this.expandable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = heightOfScreen(context) - CustomTheme.navbarHeight;
    return Container(
      width: widthOfScreen(context),
      constraints: BoxConstraints(
        minHeight: height,
        maxHeight: expandable ? double.infinity : height,
      ),
      child: child,
      decoration: decoration,
      alignment: Alignment.center,
    );
  }
}

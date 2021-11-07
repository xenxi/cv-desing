import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    Key? key,
    required this.child,
    this.decoration,
    this.expandable = true,
    this.padding,
    required this.isMobile,
  }) : super(key: key);

  final Widget child;
  final BoxDecoration? decoration;
  final bool expandable;
  final EdgeInsets? padding;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final height = heightOfScreen(context) -
        (isMobile ? CustomTheme.navbarMobileHeight : CustomTheme.navbarHeight);

    return Container(
      width: widthOfScreen(context),
      constraints: BoxConstraints(
        minHeight: height,
        maxHeight: expandable ? double.infinity : height,
      ),
      padding: padding,
      decoration: decoration,
      alignment: Alignment.center,
      child: child,
    );
  }
}

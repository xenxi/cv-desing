import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';

class Section extends StatelessWidget {
  final Widget child;
  final BoxDecoration? decoration;
  final bool expandable;
  final EdgeInsets? padding;
  const Section({
    Key? key,
    required this.child,
    this.decoration,
    this.padding,
    this.expandable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isWebMobile = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);

    final height = heightOfScreen(context) -
        (isWebMobile
            ? CustomTheme.navbarMobileHeight
            : CustomTheme.navbarHeight);

    return Container(
      width: widthOfScreen(context),
      constraints: BoxConstraints(
        minHeight: height,
        maxHeight: expandable ? double.infinity : height,
      ),
      child: child,
      padding: padding,
      decoration: decoration,
      alignment: Alignment.center,
    );
  }
}

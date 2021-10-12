import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/theme.dart';

class Section extends StatelessWidget {
  final Widget children;
  final BoxDecoration? boxDecoration;
  const Section({
    Key? key,
    required this.children,
    this.boxDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthOfScreen(context),
      height: heightOfScreen(context) - CustomTheme.navbarHeight,
      child: children,
      decoration: boxDecoration,
      alignment: Alignment.center,
    );
  }
}

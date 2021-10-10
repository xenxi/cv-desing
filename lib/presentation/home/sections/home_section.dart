import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      width: widthOfScreen(context),
      height: heightOfScreen(context),
      child: Container(
        color: Colors.blue,
        margin: EdgeInsets.only(top: CustomTheme.defaultPadding),
      ),
    );
  }
}

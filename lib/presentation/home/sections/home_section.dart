import 'dart:ui';

import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomTheme.secondaryColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(CustomTheme.secondaryColor, BlendMode.color),
          image: const AssetImage(ImagePath.bg3),
        ),
      ),
      alignment: Alignment.center,
      width: widthOfScreen(context),
      height: heightOfScreen(context),
      child: Container(
        margin: EdgeInsets.only(top: CustomTheme.defaultPadding),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Logo(height: 60),
                Spacer(),
                _buildGlassContainer(context),
                Spacer(
                  flex: 3,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGlassContainer(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(CustomTheme.defaultBorderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 600,
          width: 600,
        ),
      ),
    );
  }
}

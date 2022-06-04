import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/adaptative_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:cv_desing_website_flutter/presentation/views/home/sections/home/widgets/text_banner.dart';

class HomeSectionZoomResume extends StatelessWidget {
  const HomeSectionZoomResume({
    Key? key,
    required this.goToProjectSection,
  }) : super(key: key);

  final VoidCallback goToProjectSection;

  @override
  Widget build(BuildContext context) {
    final isMobile = isMobileScreen(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: CustomTheme.greenGradient,
        ),
      ),
      child: isMobile ? _buildMobile(context) : _buildDesktop(context),
    );
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Container(
          decoration: const BoxDecoration(
            color: CustomTheme.secondaryColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              opacity: .9,
              image: AssetImage(ImagePath.bg7),
            ),
          ),
          width: sizingInformation.screenSize.width,
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: sizingInformation.isTablet ? 600 : 1200,
            ),
            child: _buildGlassContainer(
              context,
              children: Row(
                children: [
                  Expanded(
                    child: TextBanner(
                      onButtonTap: goToProjectSection,
                    ),
                  ),
                  if (sizingInformation.isDesktop) ...[
                    const SizedBox(
                      width: CustomTheme.defaultPadding * 2,
                    ),
                    Expanded(
                      child: ZoomIn(
                        child: Image.asset(
                          ImagePath.homeMainImage2,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Stack(
      children: [
        _buildResume(context),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.only(left: widthOfScreen(context) * .05),
            width: widthOfScreen(context) * .45,
            constraints: const BoxConstraints(maxWidth: 500),
            child: TextBanner(
              onButtonTap: goToProjectSection,
              textColor: CustomTheme.secondaryColor,
              iconColor: Colors.white,
              buttonColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    double currentWidth = widthOfScreen(context) * .6;
    final diff = 555 - widthOfScreen(context);
    if (diff > 0) {
      currentWidth += (diff * .2);
    }

    return Stack(
      children: [
        _buildResume(context),
        Text(Location.homeTitle),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            // color: Colors.red,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 8, right: 8),
            width: currentWidth,
            child: TextBanner(
              onButtonTap: goToProjectSection,
              textColor: CustomTheme.secondaryColor,
              iconColor: Colors.white,
              buttonColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResume(BuildContext context) {
    double currentWidth = widthOfScreen(context) * .6;
    if (currentWidth > 800) {
      currentWidth = 800;
    }
    if (currentWidth < 400) {
      currentWidth = 400;
    }
    if (isMobileScreen(context)) {
      final currentHeight = heightOfScreen(context) * .9;
      currentWidth = currentHeight * .7;
      final diff = 555 - widthOfScreen(context);
      if (diff > 0) {
        currentWidth += (diff * .6);
      }
      print('currentWidth: $currentWidth');
      print('currentHeight: $currentHeight');
      return Positioned.fill(
        right: -currentWidth * .7,
        child: Align(
          alignment: Alignment.centerRight,
          child: _Resume(
            height: currentHeight,
            angle: -.045,
          ),
        ),
      );
    }

    return Positioned(
      right: -120,
      top: -20,
      width: currentWidth,
      height: heightOfScreen(context),
      child: const _Resume(
        height: 1180,
      ),
    );
  }

  Widget _buildGlassContainer(
    BuildContext context, {
    required Widget children,
  }) =>
      Container(
        padding: const EdgeInsets.all(CustomTheme.defaultPadding * 2),
        margin: const EdgeInsets.all(CustomTheme.defaultPadding),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: children,
        ),
      );
}

class _Resume extends StatelessWidget {
  const _Resume({
    Key? key,
    this.angle = -.15,
    this.height,
  }) : super(key: key);
  final double angle;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Transform.rotate(
        angle: angle,
        child: AspectRatio(
          aspectRatio: .7,
          child: Container(
            clipBehavior: Clip.hardEdge,
            height: height,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15,
                  offset: Offset(-15, 10), //(x,y)
                ),
              ],
            ),
            child: Image.asset(
              '${ImagePath.desingsDir}/CV12S.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.topLeft,
            ),
          ),
        ),
      ),
    );
  }
}

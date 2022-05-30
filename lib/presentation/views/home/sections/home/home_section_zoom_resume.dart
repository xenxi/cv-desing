import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/adaptative_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:cv_desing_website_flutter/presentation/views/home/sections/home/widgets/text_banner.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeSectionZoomResume extends StatelessWidget {
  const HomeSectionZoomResume({
    Key? key,
    required this.goToProjectSection,
  }) : super(key: key);

  final VoidCallback goToProjectSection;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: CustomTheme.greenGradient,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(left: widthOfScreen(context) * .1),
              width: widthOfScreen(context) * .4,
              child: TextBanner(
                onButtonTap: goToProjectSection,
              ),
            ),
          ),
          _buildResume(context),
        ],
      ),
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

  Widget _buildResume(BuildContext context) {
    final isSmallWindows = MediaQuery.of(context).size.width < 720;
    return Positioned(
      right: -120,
      top: -20,
      width: widthOfScreen(context) * .5,
      child: const _Resume(),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Transform.rotate(
        angle: -.15,
        child: Container(
          clipBehavior: Clip.hardEdge,
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
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}

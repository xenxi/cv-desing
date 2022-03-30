import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/home/widgets/text_banner.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/section.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    Key? key,
    required this.goToProjectSection,
  }) : super(key: key);

  final VoidCallback goToProjectSection;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Section(
          expandable: false,
          decoration: const BoxDecoration(
            color: CustomTheme.secondaryColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              opacity: .9,
              image: AssetImage(ImagePath.bg7),
            ),
          ),
          isMobile: sizingInformation.isMobile,
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

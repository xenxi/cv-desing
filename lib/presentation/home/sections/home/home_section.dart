import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/home/widgets/text_banner.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/home/widgets/text_mobile_banner.dart';
import 'package:flutter/material.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/section.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeSection extends StatelessWidget {
  final VoidCallback goToProjectSection;
  const HomeSection({
    Key? key,
    required this.goToProjectSection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: ResponsiveBuilder(builder: (context, sizingInformation) {
        return SizedBox(
          width: sizingInformation.screenSize.width *
              (sizingInformation.isDesktop ? .7 : 1),
          child: _buildGlassContainer(
            context,
            children: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: sizingInformation.isMobile
                      ? TextMobileBanner(
                          onButtonTap: goToProjectSection,
                        )
                      : TextBanner(
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
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                    ),
                  )),
                ],
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildGlassContainer(BuildContext context,
      {required Widget children}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(CustomTheme.defaultBorderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Padding(
          padding: const EdgeInsets.all(CustomTheme.defaultPadding * 2),
          child: children,
        ),
      ),
    );
  }
}
import 'package:cv_desing_website_flutter/presentation/auth/sections/login/sign_in_section.dart';
import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/custom_mobile_navbar.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/custom_navbar.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/navbar_item_data.dart';
import 'package:cv_desing_website_flutter/presentation/cv_desing_app.dart';
import 'package:cv_desing_website_flutter/presentation/home/home_view.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/social_data.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'sections/login/sign_in_mobile_section.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          appBar: _buildNavBar(context, sizingInformation: sizingInformation)
              as PreferredSizeWidget,
          backgroundColor: CustomTheme.secondaryColor,
          body: SingleChildScrollView(
            padding: sizingInformation.isMobile
                ? null
                : const EdgeInsets.all(CustomTheme.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMobileSection(sizingInformation),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavBar(BuildContext context,
      {required SizingInformation sizingInformation}) {
    return sizingInformation.isMobile
        ? const CustomMobileNavBar(
            loginButtonVisible: false,
          )
        : CustomNavBar(
            socialData: SocialData.links,
            navItems: [
              NavItemData(
                name: Location.home,
                onTap: () => Navigator.of(navigator.currentContext!)
                    .pushNamed(AppRouter.home),
                isSelected: true,
              ),
              NavItemData(
                name: Location.desings,
                onTap: () => Navigator.of(navigator.currentContext!)
                    .pushNamed(AppRouter.desings),
              ),
            ],
          );
  }

  Widget _buildMobileSection(SizingInformation sizingInformation) =>
      sizingInformation.isMobile
          ? const SignInMobileSection()
          : const SignInSection();
}

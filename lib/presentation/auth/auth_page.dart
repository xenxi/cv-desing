import 'package:cv_desing_website_flutter/presentation/auth/sections/login/sign_in_section.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/custom_mobile_navbar.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/custom_navbar.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/navbar_item_data.dart';
import 'package:cv_desing_website_flutter/presentation/home/home_page.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/social_data.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

final List<NavItemData> navItems = [
  NavItemData(
    name: Location.home,
    key: homeKey,
  ),
  NavItemData(name: Location.desings, key: desingsKey),
  // NavItemData(name: Location.blog, key: blogKey),
];

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          appBar: _buildNavBar(sizingInformation) as PreferredSizeWidget,
          backgroundColor: CustomTheme.secondaryColor,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(CustomTheme.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                SignInSection(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavBar(SizingInformation sizingInformation) {
    return sizingInformation.isMobile
        ? const CustomMobileNavBar()
        : CustomNavBar(
            socialData: SocialData.links,
            navItems: navItems,
          );
  }
}

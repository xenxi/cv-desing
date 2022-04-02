import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/custom_mobile_navbar.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/custom_navbar.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/navbar_item_data.dart';
import 'package:cv_desing_website_flutter/presentation/home/home_page.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/drawer/custom_drawer.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/social_data.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PublicLayout extends StatelessWidget {
  PublicLayout({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  final List<NavItemData> navItems = [
    NavItemData(name: Location.home, key: homeKey, isSelected: true),
    NavItemData(name: Location.desings, key: desingsKey),
    // NavItemData(name: Location.blog, key: blogKey),
  ];
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          appBar: _buildNavBar(sizingInformation) as PreferredSizeWidget,
          drawer: sizingInformation.isMobile
              ? CustomDrawer(
                  menuList: navItems,
                  color: CustomTheme.secondaryColor,
                )
              : null,
          body: child,
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

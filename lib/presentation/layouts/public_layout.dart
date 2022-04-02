import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/custom_mobile_navbar.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/custom_navbar.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/navbar_item_data.dart';
import 'package:cv_desing_website_flutter/presentation/home/home_page.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/drawer/custom_drawer.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/social_data.dart';
import 'package:flutter/material.dart';

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
    return Overlay(
      initialEntries: [
        OverlayEntry(builder: (context) => _buildBody(context)),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: _buildNavBar(isMobile) as PreferredSizeWidget,
      drawer: isMobile
          ? CustomDrawer(
              menuList: navItems,
              color: CustomTheme.secondaryColor,
            )
          : null,
      body: child,
    );
  }

  Widget _buildNavBar(bool isMobile) {
    return isMobile
        ? const CustomMobileNavBar()
        : CustomNavBar(
            socialData: SocialData.links,
            navItems: navItems,
          );
  }
}

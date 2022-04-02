import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/custom_mobile_navbar.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/custom_navbar.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/navbar_item_data.dart';
import 'package:cv_desing_website_flutter/presentation/cv_desing_app.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/drawer/custom_drawer.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/footer.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/adaptative_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/social_data.dart';
import 'package:flutter/material.dart';

final List<NavItemData> navItems = [
  NavItemData(
    name: Location.home,
    onTap: () =>
        Navigator.of(navigator.currentContext!).pushNamed(AppRouter.home),
    isSelected: true,
  ),
  NavItemData(
    name: Location.desings,
    onTap: () =>
        Navigator.of(navigator.currentContext!).pushNamed(AppRouter.desings),
  ),
];

class PublicLayout extends StatelessWidget {
  const PublicLayout({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(builder: (context) => _buildBody(context)),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    final isMobile = isMobileScreen(context);

    return Scaffold(
      appBar: _buildNavBar(isMobile, navItems) as PreferredSizeWidget,
      drawer: isMobile
          ? CustomDrawer(
              menuList: navItems,
              color: CustomTheme.secondaryColor,
            )
          : null,
      body: Column(
        children: [
          Expanded(child: child),
          const Padding(
            padding: EdgeInsets.all(CustomTheme.defaultPadding),
            child: Expanded(
              child: Footer(
                textColor: CustomTheme.primaryText2,
                textLinkColor: CustomTheme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBar(bool isMobile, List<NavItemData> navItems) {
    return isMobile
        ? const CustomMobileNavBar()
        : CustomNavBar(
            socialData: SocialData.links,
            navItems: navItems,
          );
  }
}

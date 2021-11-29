import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/custom_mobile_navbar.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/custom_navbar.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/navbar_item_data.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/home/widgets/black_friday_banner.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/drawer/custom_drawer.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/footer.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/scroller_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/social_data.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'sections/home/home_section.dart';
import 'sections/portfolio/portfolio_section.dart';

final GlobalKey desingsKey = GlobalKey();
final GlobalKey homeKey = GlobalKey();
final GlobalKey blogKey = GlobalKey();

final List<NavItemData> navItems = [
  NavItemData(name: Location.home, key: homeKey, isSelected: true),
  NavItemData(name: Location.desings, key: desingsKey),
  // NavItemData(name: Location.blog, key: blogKey),
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          body: SingleChildScrollView(
            child: Column(
              children: [
                HomeSection(
                  key: homeKey,
                  goToProjectSection: () =>
                      scrollToSection(desingsKey.currentContext),
                ),
                PortfolioSection(
                  key: desingsKey,
                ),
                const Padding(
                  padding: EdgeInsets.all(CustomTheme.defaultPadding),
                  child: Footer(
                    textColor: CustomTheme.primaryText2,
                    textLinkColor: CustomTheme.primaryColor,
                  ),
                ),
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

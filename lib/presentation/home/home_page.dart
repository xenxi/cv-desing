import 'package:cv_desing_website_flutter/presentation/shared/components/scroller_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links/social_button_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/social_data.dart';
import 'package:flutter/material.dart';
import 'sections/home_section.dart';
import 'sections/portfolio/portfolio_section.dart';
import 'widgets/navbar/custom_navbar.dart';
import 'widgets/navbar/navbar_item_data.dart';

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
    return Scaffold(
      appBar: CustomNavBar(
        socialData: SocialData.links,
        navItems: navItems,
      ),
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
            )
          ],
        ),
      ),
    );
  }
}

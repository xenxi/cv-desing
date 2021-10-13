import 'package:cv_desing_website_flutter/presentation/shared/components/scroller_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links/social_button_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'sections/home_section.dart';
import 'sections/portfolio/portfolio_section.dart';
import 'widgets/navbar/custom_navbar.dart';

final socialData = [
  SocialButtonData(
    tag: 'TWITTER_URL',
    iconData: FontAwesomeIcons.twitter,
    url: 'TWITTER_URL',
  ),
  SocialButtonData(
    tag: 'FACEBOOK_URL',
    iconData: FontAwesomeIcons.facebook,
    url: 'FACEBOOK_URL',
  ),
  SocialButtonData(
    tag: 'LINKED_IN_URL',
    iconData: FontAwesomeIcons.linkedin,
    url: 'LINKED_IN_URL',
  ),
  SocialButtonData(
    tag: 'INSTAGRAM_URL',
    iconData: FontAwesomeIcons.instagram,
    url: 'INSTAGRAM_URL',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey portfolioKey = GlobalKey();
    return Scaffold(
      appBar: CustomNavBar(socialData: socialData),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeSection(
              goToProjectSection: () =>
                  scrollToSection(portfolioKey.currentContext),
            ),
            PortfolioSection(
              key: portfolioKey,
            )
          ],
        ),
      ),
    );
  }
}

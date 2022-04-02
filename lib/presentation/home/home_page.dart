import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/business_cards_section.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/flyers_section.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/home/home_section.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/resumes_section.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/footer.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/scroller_funtions.dart';
import 'package:flutter/material.dart';

final GlobalKey desingsKey = GlobalKey();
final GlobalKey homeKey = GlobalKey();
final GlobalKey blogKey = GlobalKey();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeSection(
            key: homeKey,
            goToProjectSection: () =>
                scrollToSection(desingsKey.currentContext),
          ),
          // PortfolioSection(),
          ResumesSection(),
          BusinessCardsSection(),
          FlyersSection(),
          const Padding(
            padding: EdgeInsets.all(CustomTheme.defaultPadding),
            child: Footer(
              textColor: CustomTheme.primaryText2,
              textLinkColor: CustomTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/cv_desing_app.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/business_cards_section.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/flyers_section.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/home/home_section.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/resumes_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      pageSnapping: false,
      children: [
        HomeSection(
          goToProjectSection: () => Navigator.of(navigator.currentContext!)
              .pushNamed(AppRouter.desings),
        ),
        ResumesSection(),
        BusinessCardsSection(),
        FlyersSection(),
      ],
    );
  }
}

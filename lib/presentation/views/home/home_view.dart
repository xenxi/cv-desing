import 'package:cv_desing_website_flutter/application/navigation/navigation_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/views/home/sections/business_cards_section.dart';
import 'package:cv_desing_website_flutter/presentation/views/home/sections/flyers_section.dart';
import 'package:cv_desing_website_flutter/presentation/views/home/sections/home/home_section.dart';
import 'package:cv_desing_website_flutter/presentation/views/home/sections/resumes_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      pageSnapping: false,
      children: [
        HomeSection(
          goToProjectSection: () => BlocProvider.of<NavigationBloc>(context)
              .add(const NavigateToDesingsSelected()),
        ),
        ResumesSection(),
        BusinessCardsSection(),
        FlyersSection(),
      ],
    );
  }
}

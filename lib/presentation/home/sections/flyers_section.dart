import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/featured_desings/featured_desings_list.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/section.dart';
import 'package:cv_desing_website_flutter/presentation/shared/section_tittle.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/desing_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';

class FlyersSection extends StatelessWidget {
  FlyersSection({Key? key}) : super(key: key);
  final desings = DesingData.desings
      .where((e) => e.category == Category.flyer)
      .take(5)
      .toList();

  @override
  Widget build(BuildContext context) {
    return Section(
      isMobile: false,
      expandable: false,
      child: Column(
        children: [
          const SectionTitle(
            title: Location.flyers,
            subTitle: Location.portfolioSectionSubtitle,
            color: CustomTheme.primaryColor,
          ),
          Expanded(
            child: FeaturedDesingsList(desings: desings),
          ),
        ],
      ),
    );
  }
}

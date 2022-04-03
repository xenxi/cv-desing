import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/cv_desing_app.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/featured_desings/featured_desings_list.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/section.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/show_more_button.dart';
import 'package:cv_desing_website_flutter/presentation/shared/section_tittle.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/desing_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';

class BusinessCardsSection extends StatelessWidget {
  BusinessCardsSection({Key? key}) : super(key: key);
  final desings = DesingData.desings
      .where((e) => e.category == Category.businessCard)
      .take(5)
      .toList();

  @override
  Widget build(BuildContext context) {
    return Section(
      isMobile: false,
      expandable: false,
      child: Column(
        children: [
          SectionTitle(
            title: Location.businessCards,
            subTitle: Location.portfolioSectionSubtitle,
            color: CustomTheme.primaryColor,
            trailing: ShowMoreButton(
              onPressed: () => Navigator.of(navigator.currentContext!)
                  .pushNamed(AppRouter.desings),
            ),
          ),
          Expanded(
            child: FeaturedDesingsList(desings: desings),
          ),
        ],
      ),
    );
  }
}

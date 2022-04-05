import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/routes/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/cv_desing_app.dart';
import 'package:cv_desing_website_flutter/presentation/shared/section_tittle.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/desing_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/views/home/widgets/featured_desings/featured_desings_list.dart';
import 'package:cv_desing_website_flutter/presentation/views/home/widgets/show_more_button.dart';
import 'package:flutter/material.dart';

class ResumesSection extends StatelessWidget {
  ResumesSection({Key? key}) : super(key: key);
  final desings = DesingData.desings
      .where((e) => e.category == Category.curriculum)
      .take(5)
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: Location.curriculums,
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
    );
  }
}

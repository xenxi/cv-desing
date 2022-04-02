import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/portfolio/widgets/desing_items/desing_item.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/portfolio/widgets/desing_items/desing_items.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/section.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/category_extensions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/section_tittle.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/desing_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ResumesSection extends StatelessWidget {
  ResumesSection({Key? key}) : super(key: key);
  final desings = DesingData.desings
      .where((e) => e.category == Category.curriculum)
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
            title: Location.curriculums,
            subTitle: Location.portfolioSectionSubtitle,
            color: CustomTheme.primaryColor,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                bottom: CustomTheme.defaultPadding,
                left: CustomTheme.defaultPadding,
                right: CustomTheme.defaultPadding,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: desings.length,
              itemBuilder: (context, index) {
                final desing = desings[index];
                return Hero(
                  tag: desing.id,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, .5), //(x,y)
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () => openDetailView(context, desing: desing),
                      child: Image(
                        image: AssetImage(
                          desing.thumbnail(),
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void openDetailView(BuildContext context, {required Desing desing}) {
    Navigator.pushNamed(context, AppRouter.details, arguments: desing);
  }
}

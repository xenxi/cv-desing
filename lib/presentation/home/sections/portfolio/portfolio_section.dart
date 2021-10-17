import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/section.dart';
import 'package:cv_desing_website_flutter/presentation/shared/section_tittle.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/desing_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';
import 'widgets/project_categories/project_categories.dart';
import 'widgets/project_categories/project_category_data.dart';
import 'widgets/project_item/project_item.dart';

class PortfolioSection extends StatelessWidget {
  final curriculumsData = DesingData.desings;
  final categoriesData = Category.values
      .map((category) => ProjectCategoryData(
          number:
              DesingData.desings.where((e) => e.category == category).length,
          title: category.toString()))
      .toList();

  PortfolioSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      decoration: _buildSectionDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SectionTitle(
            title: Location.portfolioSectionTitle,
            subTitle: Location.portfolioSectionSubtitle,
            color: CustomTheme.primaryColor,
          ),
          ProjectCategories(
            categories: categoriesData,
          ),
          const SizedBox(
            height: 40.0,
          ),
          _buildItems()
        ],
      ),
    );
  }

  GridView _buildItems() {
    return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
            vertical: CustomTheme.defaultPadding,
            horizontal: CustomTheme.defaultPadding * 4),
        itemCount: curriculumsData.length,
        gridDelegate: _buildGridSize(),
        itemBuilder: (context, index) => FadeIn(
              child: ProjectItem(
                title: curriculumsData[index].reference,
                subtitle: curriculumsData[index].category.toString(),
                imageUrl: curriculumsData[index].url,
              ),
            ));
  }

  BoxDecoration _buildSectionDecoration() {
    return BoxDecoration(
      color: CustomTheme.primaryColor.withOpacity(.35),
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(ImagePath.bg2),
      ),
    );
  }

  SliverGridDelegateWithMaxCrossAxisExtent _buildGridSize() {
    return SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: .7,
        crossAxisSpacing: CustomTheme.defaultPadding * 2,
        mainAxisSpacing: CustomTheme.defaultPadding * 2);
  }
}

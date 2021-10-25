import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/section.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/category_extensions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/section_tittle.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/desing_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'widgets/project_categories/project_categories.dart';
import 'widgets/project_categories/project_category_data.dart';
import 'widgets/project_item/project_item.dart';

class PortfolioSection extends HookWidget {
  final categoriesData = Category.values
      .map((category) => ProjectCategoryData(
          category: category,
          number:
              DesingData.desings.where((e) => e.category == category).length,
          title: category.displayName))
      .toList();

  PortfolioSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final desings = useState(DesingData.desings);
    final categories = useState(categoriesData);
    return Section(
      decoration: _buildSectionDecoration(),
      child: ResponsiveBuilder(builder: (context, sizingInformation) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SectionTitle(
              title: Location.portfolioSectionTitle,
              subTitle: Location.portfolioSectionSubtitle,
              color: CustomTheme.primaryColor,
            ),
            ProjectCategories(
              categories: categories.value,
              onCategoryTap: (c) {
                categories.value = categoriesData
                    .map((e) => e.copyWith(isSelected: e.category == c))
                    .toList();
                desings.value =
                    DesingData.desings.where((e) => e.category == c).toList();
              },
            ),
            const SizedBox(
              height: 40.0,
            ),
            _buildItems(desings.value)
          ],
        );
      }),
    );
  }

  GridView _buildItems(List<Desing> curriculumsData) => GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
          vertical: CustomTheme.defaultPadding,
          horizontal: CustomTheme.defaultPadding * 4),
      itemCount: curriculumsData.length,
      gridDelegate: _buildGridSize(),
      itemBuilder: (context, index) {
        return ElasticIn(
          delay: Duration(milliseconds: 80 * index),
          child: ProjectItem(
            title: curriculumsData[index].reference,
            subtitle: curriculumsData[index].category.toString(),
            imageUrl: curriculumsData[index].url,
          ),
        );
      });

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

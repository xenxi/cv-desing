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
          title: category.displayName,
          isSelected: category == Category.curriculum))
      .toList();

  PortfolioSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final desings = useState(DesingData.desings);
    final categories = useState(categoriesData);
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Section(
        expandable: !sizingInformation.isMobile,
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
            _buildItems(desings.value, sizingInformation)
          ],
        ),
      );
    });
  }

  GridView _buildItemList(List<Desing> curriculumsData) => GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
          vertical: CustomTheme.defaultPadding,
          horizontal: CustomTheme.defaultPadding * 4),
      itemCount: curriculumsData.length,
      gridDelegate: _buildGridSize(),
      itemBuilder: (context, index) {
        return ElasticIn(
          delay: Duration(milliseconds: 100 * index),
          child: ProjectItem(
            title: curriculumsData[index].reference,
            subtitle: curriculumsData[index].category.toString(),
            imageUrl: curriculumsData[index].thumbnail(),
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

  Widget _buildItems(List<Desing> items, SizingInformation sizingInformation) {
    if (sizingInformation.isMobile) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.all(CustomTheme.defaultPadding),
          child: PageView.builder(
            controller: PageController(
              viewportFraction: .8,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ProjectItem(
                title: items[index].reference,
                subtitle: items[index].category.toString(),
                imageUrl: items[index].image(),
              );
            },
          ),
        ),
      );
    }

    return _buildItemList(items);
  }
}

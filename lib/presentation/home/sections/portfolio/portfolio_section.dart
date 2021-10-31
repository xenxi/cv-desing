import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
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
import 'widgets/desing_items/desing_item.dart';

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
    final desings = useState(DesingData.desings
        .where((e) => e.category == Category.curriculum)
        .toList());
    final categories = useState(categoriesData);
    final controller = usePageController();

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Section(
        // expandable: !sizingInformation.isMobile,
        decoration: _buildSectionDecoration(),
        padding: const EdgeInsets.only(bottom: CustomTheme.footerPadding),
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
            _buildItems(desings.value,
                sizingInformation: sizingInformation, controller: controller)
          ],
        ),
      );
    });
  }

  GridView _buildItemList(List<Desing> curriculumsData) => GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
          vertical: CustomTheme.defaultPadding,
          horizontal: CustomTheme.defaultPadding * 4),
      itemCount: curriculumsData.length,
      gridDelegate: _buildGridSize(),
      itemBuilder: (context, index) {
        return ElasticIn(
          delay: Duration(milliseconds: 100 * index),
          child: DesingItem(
            title: curriculumsData[index].reference,
            subtitle: curriculumsData[index].category.displayName,
            imageUrl: curriculumsData[index].thumbnail(),
            onTap: () =>
                openDetailView(context, desing: curriculumsData[index]),
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

  Widget _buildItems(List<Desing> items,
      {required SizingInformation sizingInformation,
      required PageController controller}) {
    if (sizingInformation.isMobile) {
      return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(CustomTheme.defaultPadding),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return SizedBox(
            height: heightOfScreen(context) * .5,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: DesingItem(
                title: item.reference,
                subtitle: item.category.displayName,
                imageUrl: item.thumbnail(),
                onTap: () => openDetailView(context, desing: item),
              ),
            ),
          );
        },
      );
    }

    return _buildItemList(items);
  }

  Expanded _buildMobileItemList(List<Desing> items,
      {required PageController controller}) {
    return Expanded(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              iconSize: 50,
              color: CustomTheme.primaryColor,
              icon: const Icon(
                Icons.chevron_left,
              ),
              onPressed: () => controller.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOutExpo),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              color: CustomTheme.primaryColor,
              iconSize: 50,
              icon: const Icon(
                Icons.chevron_right,
              ),
              onPressed: () => controller.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOutExpo),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 35, vertical: CustomTheme.defaultBorderRadius),
            child: PageView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              pageSnapping: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: CustomTheme.defaultBorderRadius),
                  child: DesingItem(
                    title: items[index].reference,
                    subtitle: items[index].category.displayName,
                    imageUrl: items[index].thumbnail(),
                    onTap: () => openDetailView(context, desing: items[index]),
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

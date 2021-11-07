import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/portfolio/widgets/desing_items/desing_items.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/portfolio/widgets/desing_items/desing_mobile_items.dart';
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

class PortfolioSection extends HookWidget {
  PortfolioSection({Key? key}) : super(key: key);

  final categoriesData = Category.values
      .map(
        (category) => ProjectCategoryData(
          category: category,
          number:
              DesingData.desings.where((e) => e.category == category).length,
          title: category.displayName,
          isSelected: category == Category.curriculum,
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    final desings = useState(
      DesingData.desings
          .where((e) => e.category == Category.curriculum)
          .toList(),
    );
    final categories = useState(categoriesData);
    final controller = usePageController();

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Section(
          isMobile: sizingInformation.isMobile,
          decoration: _buildSectionDecoration(),
          padding: const EdgeInsets.only(
            bottom: CustomTheme.footerPadding,
            left: CustomTheme.defaultPadding,
            right: CustomTheme.defaultPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SectionTitle(
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
              _buildItems(
                desings.value,
                sizingInformation: sizingInformation,
                controller: controller,
              )
            ],
          ),
        );
      },
    );
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

  Widget _buildItems(
    List<Desing> items, {
    required SizingInformation sizingInformation,
    required PageController controller,
  }) {
    if (sizingInformation.isMobile) {
      return DesingMobileItems(
        desings: items,
        onItemTap: openDetailView,
      );
    }

    return DesingItems(
      desings: items,
      onItemTap: openDetailView,
    );
  }

  void openDetailView(BuildContext context, {required Desing desing}) {
    Navigator.pushNamed(context, AppRouter.details, arguments: desing);
  }
}

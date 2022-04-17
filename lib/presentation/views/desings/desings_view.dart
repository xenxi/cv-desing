import 'package:cv_desing_website_flutter/application/desings/desings_bloc.dart';
import 'package:cv_desing_website_flutter/application/navigation/navigation_bloc.dart';
import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/shared/section_tittle.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/views/desings/widgets/desing_items/desing_items.dart';
import 'package:cv_desing_website_flutter/presentation/views/desings/widgets/desing_items/desing_mobile_items.dart';
import 'package:cv_desing_website_flutter/presentation/views/desings/widgets/project_categories/project_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DesingsView extends StatelessWidget {
  const DesingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DesingsBloc>()
        ..add(const FilterCategoryChanged(category: Category.curriculum)),
      child: SingleChildScrollView(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            return Container(
              decoration: _buildSectionDecoration(),
              constraints: BoxConstraints(
                minHeight: sizingInformation.screenSize.height,
              ),
              padding: const EdgeInsets.only(
                bottom: CustomTheme.footerPadding,
                left: CustomTheme.defaultPadding,
                right: CustomTheme.defaultPadding,
              ),
              child: BlocBuilder<DesingsBloc, DesingsState>(
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SectionTitle(
                        title: Location.portfolioSectionTitle,
                        subTitle: Location.portfolioSectionSubtitle,
                        color: CustomTheme.primaryColor,
                      ),
                      ProjectCategories(
                        categories: Category.values,
                        currentCategoryOption: state.categoryOption,
                        onCategorySelected: (category) =>
                            _onCategorySelected(context, category: category),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      _buildItems(
                        state.desings,
                        sizingInformation: sizingInformation,
                      )
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _onCategorySelected(
    BuildContext context, {
    required Category category,
  }) =>
      BlocProvider.of<DesingsBloc>(context)
          .add(FilterCategoryChanged(category: category));

  BoxDecoration _buildSectionDecoration() {
    return BoxDecoration(
      color: CustomTheme.primaryColor.withOpacity(.35),
      image: const DecorationImage(
        fit: BoxFit.none,
        image: AssetImage(ImagePath.bg12),
        repeat: ImageRepeat.repeat,
      ),
    );
  }

  Widget _buildItems(
    List<Desing> items, {
    required SizingInformation sizingInformation,
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

  void openDetailView(BuildContext context, {required Desing desing}) =>
      BlocProvider.of<NavigationBloc>(context)
          .add(DesingDetailsOpened(reference: desing.reference));
}

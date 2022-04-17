import 'package:cv_desing_website_flutter/application/desings/desings_bloc.dart';
import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/category_extensions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/desing_data.dart';
import 'package:cv_desing_website_flutter/presentation/views/desings/widgets/project_categories/project_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectCategories extends StatelessWidget {
  const ProjectCategories({
    required this.categories,
    Key? key,
  }) : super(key: key);
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DesingsBloc, DesingsState>(
      builder: (context, state) {
        return Wrap(
          spacing: 20,
          runSpacing: 16,
          children: [
            ...categories.map(
              (category) => ProjectCategory(
                title: category.displayName,
                number: DesingData.desings
                    .where((e) => e.category == category)
                    .length,
                isSelected: state.categoryOption.fold(
                  () => false,
                  (selectedCategory) => selectedCategory == category,
                ),
                onTap: (selectedCategory) =>
                    _onCategoryTap(context, selectedCategory),
                category: category,
                hoverColor: CustomTheme.primaryColor,
              ),
            )
          ],
        );
      },
    );
  }

  void _onCategoryTap(BuildContext context, Category category) =>
      BlocProvider.of<DesingsBloc>(context).add(
        FilterCategoryChanged(
          category: category,
        ),
      );
}

import 'package:cv_desing_website_flutter/application/desings/desings_bloc.dart';
import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/category_extensions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/desing_data.dart';
import 'package:cv_desing_website_flutter/presentation/views/desings/widgets/project_categories/project_category.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectCategories extends StatelessWidget {
  const ProjectCategories({
    Key? key,
    required this.currentCategoryOption,
    required this.categories,
    required this.onCategorySelected,
  }) : super(key: key);
  final Option<Category> currentCategoryOption;
  final List<Category> categories;
  final void Function(Category) onCategorySelected;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 16,
      children: [
        ...categories.map(
          (category) => _buildCategory(context, category: category),
        )
      ],
    );
  }

  Widget _buildCategory(
    BuildContext context, {
    required Category category,
  }) =>
      ProjectCategory(
        title: category.displayName,
        number: DesingData.desings.where((e) => e.category == category).length,
        isSelected: _isSelected(category),
        onTap: onCategorySelected,
        category: category,
        hoverColor: CustomTheme.primaryColor,
      );

  bool _isSelected(
    Category category,
  ) =>
      currentCategoryOption.fold(
        () => false,
        (selectedCategory) => selectedCategory == category,
      );
}

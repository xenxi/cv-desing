import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/presentation/desings/widgets/project_categories/project_category.dart';
import 'package:cv_desing_website_flutter/presentation/desings/widgets/project_categories/project_category_data.dart';
import 'package:flutter/material.dart';

class ProjectCategories extends StatelessWidget {
  const ProjectCategories({
    Key? key,
    required this.categories,
    required this.onCategoryTap,
  }) : super(key: key);

  final List<ProjectCategoryData> categories;
  final void Function(Category category) onCategoryTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 16,
      children: _buildProjectCategories(context, categories: categories),
    );
  }

  List<Widget> _buildProjectCategories(
    BuildContext context, {
    required List<ProjectCategoryData> categories,
  }) {
    final List<Widget> items = [];
    final hoverColor = Theme.of(context).primaryColor;

    for (int index = 0; index < categories.length; index++) {
      items.add(
        ProjectCategory(
          title: categories[index].title,
          number: categories[index].number,
          isSelected: categories[index].isSelected,
          onTap: onCategoryTap,
          category: categories[index].category,
          hoverColor: hoverColor,
        ),
      );
    }
    return items;
  }
}

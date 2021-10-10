import 'package:cv_desing_website_flutter/presentation/home/sections/portfolio/widgets/project_categories/project_category_data.dart';
import 'package:flutter/material.dart';
import 'project_category.dart';

class ProjectCategories extends StatelessWidget {
  final List<ProjectCategoryData> categories;
  const ProjectCategories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 16,
      children: _buildProjectCategories(context, categories: categories),
    );
  }

  List<Widget> _buildProjectCategories(BuildContext context,
      {required List<ProjectCategoryData> categories}) {
    List<Widget> items = [];
    final hoverColor = Theme.of(context).primaryColor;

    for (int index = 0; index < categories.length; index++) {
      items.add(
        ProjectCategory(
          title: categories[index].title,
          number: categories[index].number,
          isSelected: categories[index].isSelected,
          onTap: () => {},
          hoverColor: hoverColor,
        ),
      );
    }
    return items;
  }
}

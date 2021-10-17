import 'package:cv_desing_website_flutter/domain/category.dart';

class ProjectCategoryData {
  final String title;
  final int number;
  final bool isSelected;
  final Category category;
  ProjectCategoryData({
    required this.title,
    required this.number,
    required this.category,
    this.isSelected = false,
  });
}

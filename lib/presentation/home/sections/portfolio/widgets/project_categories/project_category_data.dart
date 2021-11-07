import 'package:cv_desing_website_flutter/domain/category.dart';

class ProjectCategoryData {
  ProjectCategoryData({
    required this.title,
    required this.number,
    required this.category,
    this.isSelected = false,
  });

  final String title;
  final int number;
  final bool isSelected;
  final Category category;

  ProjectCategoryData copyWith({
    String? title,
    int? number,
    bool? isSelected,
    Category? category,
  }) {
    return ProjectCategoryData(
      title: title ?? this.title,
      number: number ?? this.number,
      isSelected: isSelected ?? this.isSelected,
      category: category ?? this.category,
    );
  }
}

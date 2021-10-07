import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/domain/curriculum.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';

import 'project_categories/project_categories.dart';

class ProjectCategoryData {
  final String title;
  final int number;
  bool isSelected;

  ProjectCategoryData({
    required this.title,
    required this.number,
    this.isSelected = false,
  });
}

class Gallery extends StatelessWidget {
  final List<Curriculum> curriculumsData;

  final List<ProjectCategoryData> projectCategories;
  const Gallery({
    Key? key,
    required this.curriculumsData,
    required this.projectCategories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.red),
      width: widthOfScreen(context),
      height: heightOfScreen(context),
      child: ListView(
        children: [
          ProjectCategories(
            categories: projectCategories,
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: assignWidth(context: context, fraction: 0.0099),
            runSpacing: assignHeight(context: context, fraction: 0.02),
            children: _buildItems(context),
          )
        ],
      ),
    );
  }

  List<Widget> _buildItems(BuildContext context) {
    return curriculumsData.map((cv) => _buildItem(context, data: cv)).toList();
  }

  Widget _buildItem(BuildContext context, {required Curriculum data}) =>
      Container(
        height: 400,
        width: 500,
        child: Stack(
          children: [
            Image.asset(
              data.url,
              width: 500,
              height: 400,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            )
          ],
        ),
      );
}

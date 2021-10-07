import 'package:cv_desing_website_flutter/presentation/portfolio/widgets/project_categories/project_category_data.dart';
import 'package:cv_desing_website_flutter/presentation/portfolio/widgets/project_item/project_item.dart';
import 'package:flutter/material.dart';
import 'package:cv_desing_website_flutter/domain/curriculum.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'project_categories/project_categories.dart';

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
      color: Colors.white,
      width: widthOfScreen(context),
      height: heightOfScreen(context),
      child: ListView(
        children: [
          ProjectCategories(
            categories: projectCategories,
          ),
          const SizedBox(
            height: 40.0,
          ),
          Container(
            width: widthOfScreen(context),
            child: Wrap(
              spacing: assignWidth(context: context, fraction: 0.025),
              runSpacing: assignWidth(context: context, fraction: 0.025),
              children: _buildProjects(context, data: curriculumsData),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildProjects(BuildContext context,
      {required List<Curriculum> data}) {
    List<Widget> items = [];
    for (int index = 0; index < data.length; index++) {
      items.add(ProjectItem(
        width: assignWidth(context: context, fraction: 0.225),
        height: assignHeight(context: context, fraction: 0.4),
        bannerHeight: assignHeight(context: context, fraction: 0.4) / 3,
        title: data[index].reference,
        subtitle: data[index].category,
        imageUrl: data[index].url,
      ));
    }

    return items;
  }

  List<Widget> _buildItems(BuildContext context) {
    return curriculumsData.map((cv) => _buildItem(context, data: cv)).toList();
  }

  Widget _buildItem(BuildContext context, {required Curriculum data}) =>
      SizedBox(
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

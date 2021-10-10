import 'package:cv_desing_website_flutter/presentation/home/sections/portfolio/widgets/project_categories/project_category_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/section_tittle.dart';
import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:cv_desing_website_flutter/domain/curriculum.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'project_categories/project_categories.dart';
import 'project_item/project_item.dart';

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
          SectionTitle(
            title: "Diseños",
            subTitle: "Lorem ipsum dolor est",
            color: CustomTheme.primaryColor,
          ),
          ProjectCategories(
            categories: projectCategories,
          ),
          const SizedBox(
            height: 40.0,
          ),
          SizedBox(
            width: widthOfScreen(context),
            child: Wrap(
              spacing: CustomTheme.defaultPadding,
              runSpacing: CustomTheme.defaultPadding * 2,
              children: _buildProjects(context, data: curriculumsData),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildProjects(BuildContext context,
          {required List<Curriculum> data}) =>
      List.generate(
          data.length,
          (index) => ProjectItem(
                width: 300,
                height: assignHeight(context: context, fraction: 0.3),
                bannerHeight: assignHeight(context: context, fraction: 0.4) / 3,
                title: data[index].reference,
                subtitle: data[index].category,
                imageUrl: data[index].url,
              ));
}

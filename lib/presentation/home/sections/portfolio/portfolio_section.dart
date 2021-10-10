import 'package:cv_desing_website_flutter/domain/curriculum.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/section_tittle.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:flutter/material.dart';
import 'widgets/project_categories/project_categories.dart';
import 'widgets/project_categories/project_category_data.dart';
import 'widgets/project_item/project_item.dart';

final curriculumsData = [
  Curriculum(1, 'CV12A', 'assets/cvs/CV12A.jpg', 'Curriculum'),
  Curriculum(2, 'CV12B', 'assets/cvs/CV12B.jpg', 'Curriculum'),
  Curriculum(3, 'CV12C', 'assets/cvs/CV12C.jpg', 'Curriculum'),
  Curriculum(4, 'CV12E', 'assets/cvs/CV12E.jpg', 'Curriculum'),
  // Curriculum(5, 'CV12H', 'assets/cvs/CV12H.jpg', 'Curriculum'),
  // Curriculum(6, 'CV12J', 'assets/cvs/CV12J.jpg', 'Curriculum'),
  // Curriculum(7, 'CV12K', 'assets/cvs/CV12K.jpg', 'Curriculum'),
  // Curriculum(8, 'CV12M', 'assets/cvs/CV12M.jpg', 'Curriculum'),
  // Curriculum(9, 'CV12N', 'assets/cvs/CV12N.jpg', 'Curriculum'),
  // Curriculum(10, 'CV12O', 'assets/cvs/CV12O.jpg', 'Curriculum'),
  // Curriculum(11, 'CV12P', 'assets/cvs/CV12P.jpg', 'Curriculum'),
  // Curriculum(12, 'CV12Q', 'assets/cvs/CV12Q.jpg', 'Curriculum'),
  // Curriculum(13, 'CV12R', 'assets/cvs/CV12R.jpg', 'Curriculum'),
];
final categoriesData = [
  ProjectCategoryData(number: 0, title: 'Test 1'),
  ProjectCategoryData(number: 1, title: 'Test 2'),
  ProjectCategoryData(number: 2, title: 'Test 3'),
];

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: CustomTheme.defaultPadding * 6),
      width: double.infinity,
      height: heightOfScreen(context),
      decoration: BoxDecoration(
        color: const Color(0xFFF7E8FF).withOpacity(0.3),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImagePath.bg2),
        ),
      ),
      child: Column(
        children: [
          SectionTitle(
            title: "Diseños",
            subTitle: "Lorem ipsum dolor est",
            color: CustomTheme.primaryColor,
          ),
          ProjectCategories(
            categories: categoriesData,
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

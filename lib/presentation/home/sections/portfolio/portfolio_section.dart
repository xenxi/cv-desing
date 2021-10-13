import 'package:cv_desing_website_flutter/domain/curriculum.dart';
import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/section.dart';
import 'package:cv_desing_website_flutter/presentation/shared/section_tittle.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'widgets/project_categories/project_categories.dart';
import 'widgets/project_categories/project_category_data.dart';
import 'widgets/project_item/project_item.dart';

final curriculumsData = [
  Curriculum(1, 'CV12A', 'assets/cvs/thumbnail/CV12A.jpg', 'Curriculum'),
  Curriculum(2, 'CV12B', 'assets/cvs/thumbnail/CV12B.jpg', 'Curriculum'),
  Curriculum(3, 'CV12C', 'assets/cvs/thumbnail/CV12C.jpg', 'Curriculum'),
  Curriculum(4, 'CV12E', 'assets/cvs/thumbnail/CV12E.jpg', 'Curriculum'),
  Curriculum(5, 'CV12H', 'assets/cvs/thumbnail/CV12H.jpg', 'Curriculum'),
  Curriculum(6, 'CV12J', 'assets/cvs/thumbnail/CV12J.jpg', 'Curriculum'),
  Curriculum(7, 'CV12K', 'assets/cvs/thumbnail/CV12K.jpg', 'Curriculum'),
  Curriculum(8, 'CV12M', 'assets/cvs/thumbnail/CV12M.jpg', 'Curriculum'),
  Curriculum(9, 'CV12N', 'assets/cvs/thumbnail/CV12N.jpg', 'Curriculum'),
  Curriculum(10, 'CV12O', 'assets/cvs/thumbnail/CV12O.jpg', 'Curriculum'),
  Curriculum(11, 'CV12P', 'assets/cvs/thumbnail/CV12P.jpg', 'Curriculum'),
  Curriculum(12, 'CV12Q', 'assets/cvs/thumbnail/CV12Q.jpg', 'Curriculum'),
  Curriculum(13, 'CV12R', 'assets/cvs/thumbnail/CV12R.jpg', 'Curriculum'),
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
    return Section(
      decoration: _buildSectionDecoration(),
      child: ResponsiveBuilder(
          builder: (BuildContext context, SizingInformation sizingInformation) {
        return Column(
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
            Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.all(CustomTheme.defaultPadding * 2),
                    itemCount: curriculumsData.length,
                    gridDelegate: _buildGridSize(),
                    itemBuilder: (context, index) => ProjectItem(
                          title: curriculumsData[index].reference,
                          subtitle: curriculumsData[index].category,
                          imageUrl: curriculumsData[index].url,
                        )))
          ],
        );
      }),
    );
  }

  BoxDecoration _buildSectionDecoration() {
    return BoxDecoration(
      color: CustomTheme.primaryColor.withOpacity(.35),
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(ImagePath.bg2),
      ),
    );
  }

  SliverGridDelegateWithMaxCrossAxisExtent _buildGridSize() {
    return const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        // mainAxisExtent: 100,
        childAspectRatio: .7,
        crossAxisSpacing: 50,
        mainAxisSpacing: 20);
  }
}

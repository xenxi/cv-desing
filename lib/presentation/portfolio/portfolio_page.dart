import 'package:cv_desing_website_flutter/domain/curriculum.dart';
import 'package:cv_desing_website_flutter/presentation/portfolio/widgets/gallery_widget.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links/social_button_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/navbar/app_bar_widget.dart';

final curriculumsData = [
  Curriculum(1, 'CV12A', 'assets/cvs/CV12A.jpg'),
  Curriculum(2, 'CV12B', 'assets/cvs/CV12B.jpg'),
  Curriculum(3, 'CV12C', 'assets/cvs/CV12C.jpg'),
  Curriculum(4, 'CV12E', 'assets/cvs/CV12E.jpg'),
  Curriculum(5, 'CV12H', 'assets/cvs/CV12H.jpg'),
  Curriculum(6, 'CV12J', 'assets/cvs/CV12J.jpg'),
  Curriculum(7, 'CV12K', 'assets/cvs/CV12K.jpg'),
  Curriculum(8, 'CV12M', 'assets/cvs/CV12M.jpg'),
  Curriculum(9, 'CV12N', 'assets/cvs/CV12N.jpg'),
  Curriculum(10, 'CV12O', 'assets/cvs/CV12O.jpg'),
  Curriculum(11, 'CV12P', 'assets/cvs/CV12P.jpg'),
  Curriculum(12, 'CV12Q', 'assets/cvs/CV12Q.jpg'),
  Curriculum(13, 'CV12R', 'assets/cvs/CV12R.jpg'),
];
final categoriesData = [
  ProjectCategoryData(number: 0, title: 'Test 1'),
  ProjectCategoryData(number: 1, title: 'Test 2'),
  ProjectCategoryData(number: 2, title: 'Test 3'),
];
final socialData = [
  SocialButtonData(
    tag: 'TWITTER_URL',
    iconData: FontAwesomeIcons.twitter,
    url: 'TWITTER_URL',
  ),
  SocialButtonData(
    tag: 'FACEBOOK_URL',
    iconData: FontAwesomeIcons.facebook,
    url: 'FACEBOOK_URL',
  ),
  SocialButtonData(
    tag: 'LINKED_IN_URL',
    iconData: FontAwesomeIcons.linkedin,
    url: 'LINKED_IN_URL',
  ),
  SocialButtonData(
    tag: 'INSTAGRAM_URL',
    iconData: FontAwesomeIcons.instagram,
    url: 'INSTAGRAM_URL',
  ),
];

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(socialData: socialData),
      body: GalleryWidget(
        curriculumsData: curriculumsData,
        projectCategories: categoriesData,
      ),
    );
  }
}

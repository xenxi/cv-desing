import 'package:cv_desing_website_flutter/domain/curriculum.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_button.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/gallery_widget.dart';

final data = [
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
      appBar: _buildAppBar(context),
      body: GalleryWidget(
        curriculums: data,
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      title: Container(
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 1.0,
            )
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Image.asset(
                ImagePath.logo,
                height: 52,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 20),
              VerticalDivider(thickness: .8),
              Spacer(flex: 1),
              Row(
                children: [
                  ..._buildSocialIcons(socialData),
                  SizedBox(
                    width: 20.0,
                  )
                ],
              ),
              VerticalDivider(thickness: .8),
              SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSocialIcons(List<SocialButtonData> socialItems) {
    List<Widget> items = [];
    for (int index = 0; index < socialItems.length; index++) {
      items.add(
        SocialButton(
          tag: socialItems[index].tag,
          iconData: socialItems[index].iconData,
          onPressed: () => {},
        ),
      );
      items.add(SizedBox(
        width: 16,
      ));
    }
    return items;
  }
}

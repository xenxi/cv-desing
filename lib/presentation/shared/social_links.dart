import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links/social_button.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links/social_button_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/social_data.dart';
import 'package:flutter/material.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildSocialIcons(SocialData.links),
    );
  }

  List<Widget> _buildSocialIcons(List<SocialButtonData> socialItems) {
    List<Widget> items = [];
    var delay = 1000;
    for (var item in socialItems) {
      items.add(
        ElasticIn(
          delay: Duration(milliseconds: delay),
          child: SocialButton(
            tag: item.tag,
            iconData: item.iconData,
            onPressed: item.onPressed,
            buttonColor: Colors.transparent,
            elevation: 0,
            iconSize: 25,
            iconColor: CustomTheme.primaryColor,
          ),
        ),
      );
      items.add(const SizedBox(
        width: 16,
      ));

      delay += 500;
    }

    return items;
  }
}

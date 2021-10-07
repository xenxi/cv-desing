import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/presentation/shared/social_button.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final List<SocialButtonData> socialData;
  const AppBarWidget({
    Key? key,
    required this.socialData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

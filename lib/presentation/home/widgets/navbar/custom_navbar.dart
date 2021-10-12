import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links/social_button.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links/social_button_data.dart';
import 'package:flutter/material.dart';
import 'navbar_divider.dart';

class CustomNavBar extends StatelessWidget with PreferredSizeWidget {
  final List<SocialButtonData> socialData;
  const CustomNavBar({
    Key? key,
    required this.socialData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: CustomTheme.navbarHeight,
      backgroundColor: Colors.white,
      title: IntrinsicHeight(
        child: Row(
          children: [
            const Logo(
              height: 80,
            ),
            const SizedBox(width: 20),
            const NavbarDivider(),
            const Spacer(flex: 1),
            Row(
              children: [
                ..._buildSocialIcons(socialData),
                const SizedBox(
                  width: 20.0,
                )
              ],
            ),
            const NavbarDivider(),
            const SizedBox(width: 20),
          ],
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
      items.add(const SizedBox(
        width: 16,
      ));
    }
    return items;
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/navbar/login_button.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links/social_button.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links/social_button_data.dart';
import 'package:flutter/material.dart';

import 'navbar_divider.dart';
import 'navbar_item_data.dart';
import 'navbar_items.dart';

class CustomNavBar extends StatelessWidget with PreferredSizeWidget {
  const CustomNavBar({
    Key? key,
    required this.socialData,
    required this.navItems,
  }) : super(key: key);

  final List<SocialButtonData> socialData;
  final List<NavItemData> navItems;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: CustomTheme.navbarHeight,
      backgroundColor: Colors.white,
      title: IntrinsicHeight(
        child: Row(
          children: [
            Logo(
              height: 80,
              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                AppRouter.home,
                (Route<dynamic> route) => false,
              ),
            ),
            const SizedBox(width: 20),
            const NavbarDivider(),
            Expanded(
              child: NavbarItems(
                navItems: navItems,
              ),
            ),
            const Spacer(),
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
            const LoginButton()
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSocialIcons(List<SocialButtonData> socialItems) {
    final List<Widget> items = [];

    for (final item in socialItems) {
      items.add(
        SocialButton(
          tag: item.tag,
          iconData: item.iconData,
          onPressed: item.onPressed,
        ),
      );
      items.add(
        const SizedBox(
          width: 16,
        ),
      );
    }

    return items;
  }

  @override
  Size get preferredSize => const Size.fromHeight(CustomTheme.navbarHeight);
}

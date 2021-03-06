import 'package:cv_desing_website_flutter/application/navigation/navigation_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/login_button/login_button.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/navbar_divider.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/navbar_item_data.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/navbar_items.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links/social_button.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links/social_button_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      foregroundColor: Colors.black,
      title: Row(
        children: [
          Logo(
            height: 80,
            onTap: () => BlocProvider.of<NavigationBloc>(context)
                .add(const HomeOpened()),
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

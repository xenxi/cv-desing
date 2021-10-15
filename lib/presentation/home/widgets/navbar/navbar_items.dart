import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/scroller_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';

import 'nav_item.dart';
import 'navbar_item_data.dart';

class NavbarItems extends StatelessWidget {
  final List<NavItemData> navItems;
  const NavbarItems({
    Key? key,
    required this.navItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: navItems
          .map((dataItem) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: NavItem(
                  title: dataItem.name,
                  isSelected: dataItem.isSelected,
                  onTap: () => _onTapNavItem(
                    context,
                    key: dataItem.key,
                    navItemName: dataItem.name,
                  ),
                ),
              ))
          .toList(),
    );
  }

  void _onTapNavItem(
    BuildContext context, {
    required GlobalKey key,
    required String navItemName,
  }) {
    if (navItemName == Location.blog) {
      Navigator.of(context).pushNamed(AppRouter.blog);
    } else {
      for (int index = 0; index < navItems.length; index++) {
        if (navItemName == navItems[index].name) {
          scrollToSection(key.currentContext!);
          navItems[index].isSelected = true;
        } else {
          navItems[index].isSelected = false;
        }
      }
    }
  }
}

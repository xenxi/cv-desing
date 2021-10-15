import 'package:cv_desing_website_flutter/presentation/shared/components/scroller_funtions.dart';
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
      children: navItems
          .map((dataItem) => NavItem(
                title: dataItem.name,
                isSelected: dataItem.isSelected,
                onTap: () => _onTapNavItem(
                  context: dataItem.key,
                  navItemName: dataItem.name,
                ),
              ))
          .toList(),
    );
  }

  void _onTapNavItem({
    required GlobalKey context,
    required String navItemName,
  }) {
    for (int index = 0; index < navItems.length; index++) {
      if (navItemName == navItems[index].name) {
        scrollToSection(context.currentContext!);
        navItems[index].isSelected = true;
      } else {
        navItems[index].isSelected = false;
      }
    }
  }
}

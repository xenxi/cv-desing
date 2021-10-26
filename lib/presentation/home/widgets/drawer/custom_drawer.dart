import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/navbar/nav_item.dart';
import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/presentation/home/widgets/navbar/navbar_item_data.dart';

class CustomDrawer extends StatelessWidget {
  final Color color;
  final double? width;
  final List<NavItemData> menuList;
  const CustomDrawer({
    Key? key,
    required this.color,
    this.width,
    required this.menuList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? widthOfScreen(context) * .85,
      child: Drawer(
        backgroundColor: color,
        child: Padding(
          padding: EdgeInsets.all(CustomTheme.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildMenuList(context, menuList: menuList),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenuList(
    BuildContext context, {
    required List<NavItemData> menuList,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        NavItem(
          onTap: () => {},
          title: menuList[i].name,
          isSelected: menuList[i].isSelected,
          titleStyle: textTheme.bodyText1?.copyWith(
            color: menuList[i].isSelected
                ? CustomTheme.primaryColor
                : Colors.white,
            fontSize: 16,
            fontWeight:
                menuList[i].isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
      menuItems.add(const Spacer());
    }
    return menuItems;
  }
}

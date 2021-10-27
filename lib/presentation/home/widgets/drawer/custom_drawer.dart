import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/footer.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/navbar/nav_item.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/scroller_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/presentation/home/widgets/navbar/navbar_item_data.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomDrawer extends HookWidget {
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
    final items = useState(menuList);
    return SizedBox(
      width: width ?? widthOfScreen(context) * .85,
      child: Drawer(
        backgroundColor: color,
        child: Padding(
          padding: EdgeInsets.all(CustomTheme.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Logo(height: 52),
                  const Spacer(),
                  IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      iconSize: 30,
                      color: Colors.white,
                      icon: const Icon(
                        Icons.close,
                      ))
                ],
              ),
              const Spacer(flex: 2),
              ..._buildMenuList(context, menuList: items),
              const Spacer(flex: 6),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenuList(
    BuildContext context, {
    required ValueNotifier<List<NavItemData>> menuList,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.value.length; i++) {
      menuItems.add(
        NavItem(
          onTap: () => _onTapNavItem(context,
              items: menuList, selected: menuList.value[i]),
          title: menuList.value[i].name,
          isSelected: menuList.value[i].isSelected,
          titleStyle: textTheme.bodyText1?.copyWith(
            color: menuList.value[i].isSelected
                ? CustomTheme.primaryColor
                : Colors.white,
            fontSize: 16,
            fontWeight: menuList.value[i].isSelected
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      );
      menuItems.add(const Spacer());
    }
    return menuItems;
  }

  void _onTapNavItem(
    BuildContext context, {
    required NavItemData selected,
    required ValueNotifier<List<NavItemData>> items,
  }) {
    if (selected.name == Location.blog) {
      Navigator.of(context).pushNamed(AppRouter.blog);
    } else {
      for (var item in items.value) {
        if (selected.name == item.name) {
          scrollToSection(item.key.currentContext!);
          item.isSelected = true;
        } else {
          item.isSelected = false;
        }
      }
      items.value = List.from(menuList);
    }

    Navigator.of(context).pop();
  }
}

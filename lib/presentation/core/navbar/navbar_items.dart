import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/nav_item.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/navbar_item_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/scroller_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NavbarItems extends HookWidget {
  const NavbarItems({
    Key? key,
    required this.navItems,
  }) : super(key: key);

  final List<NavItemData> navItems;

  @override
  Widget build(BuildContext context) {
    final items = useState(navItems);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items.value
          .map(
            (dataItem) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: NavItem(
                title: dataItem.name,
                isSelected: dataItem.isSelected,
                onTap: () =>
                    _onTapNavItem(context, selected: dataItem, items: items),
              ),
            ),
          )
          .toList(),
    );
  }

  void _onTapNavItem(
    BuildContext context, {
    required NavItemData selected,
    required ValueNotifier<List<NavItemData>> items,
  }) {
    if (selected.name == Location.blog) {
      Navigator.of(context).pushNamed(AppRouter.blog);
    } else {
      for (final item in items.value) {
        item.isSelected = selected.name == item.name;
      }
      items.value = List.from(navItems);

      selected.onTap();
    }
  }
}

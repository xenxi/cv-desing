import 'package:cv_desing_website_flutter/application/navigation/bloc/navigation_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/nav_item.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/navbar_item_data.dart';
import 'package:cv_desing_website_flutter/presentation/core/routes/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/adaptative_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/views/home/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.color,
    this.width,
    required this.menuList,
  }) : super(key: key);

  final Color color;
  final double? width;
  final List<NavItemData> menuList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? widthOfScreen(context) * .85,
      child: Drawer(
        backgroundColor: color,
        child: Padding(
          padding: const EdgeInsets.all(CustomTheme.defaultPadding),
          child: BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Logo(height: 52),
                      const Spacer(),
                      IconButton(
                        onPressed: () => Scaffold.of(context).closeDrawer(),
                        iconSize: 30,
                        color: Colors.white,
                        icon: const Icon(
                          Icons.close,
                        ),
                      )
                    ],
                  ),
                  const Spacer(flex: 2),
                  ..._buildMenuList(context,
                      menuList: menuList,
                      selectedDisplayName: state.displayName),
                  const Spacer(flex: 6),
                  const Footer(
                    textColor: CustomTheme.primaryText2,
                    textLinkColor: Colors.white,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenuList(
    BuildContext context, {
    required List<NavItemData> menuList,
    required String selectedDisplayName,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        NavItem(
          onTap: () => BlocProvider.of<NavigationBloc>(context)
              .add(menuList[i].onTapEvent),
          title: menuList[i].name,
          isSelected: selectedDisplayName == menuList[i].name,
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
      items.value = List.from(menuList);

      // selected.onTap();
    }

    Navigator.of(context).pop();
  }
}

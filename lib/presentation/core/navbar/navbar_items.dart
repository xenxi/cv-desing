import 'package:cv_desing_website_flutter/application/navigation/bloc/navigation_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/nav_item.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/navbar_item_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavbarItems extends StatelessWidget {
  const NavbarItems({
    Key? key,
    required this.navItems,
  }) : super(key: key);

  final List<NavItemData> navItems;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: navItems
              .map(
                (dataItem) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: NavItem(
                    title: dataItem.name,
                    isSelected: state.path == dataItem.onTapEvent.routeName,
                    onTap: () => BlocProvider.of<NavigationBloc>(context)
                        .add(dataItem.onTapEvent),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

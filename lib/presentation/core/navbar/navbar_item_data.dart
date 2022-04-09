import 'package:cv_desing_website_flutter/application/navigation/bloc/navigation_bloc.dart';

class NavItemData {
  NavItemData({
    required this.name,
    required this.onTapEvent,
    this.isSelected = false,
  });

  final String name;
  final NavigationEvent onTapEvent;
  bool isSelected;
}

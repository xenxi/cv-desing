import 'package:flutter/material.dart';

class NavItemData {
  NavItemData({
    required this.name,
    required this.key,
    this.isSelected = false,
  });

  final String name;
  final GlobalKey key;
  bool isSelected;
}

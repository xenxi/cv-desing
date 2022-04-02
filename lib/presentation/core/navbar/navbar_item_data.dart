class NavItemData {
  NavItemData({
    required this.name,
    required this.onTap,
    this.isSelected = false,
  });

  final String name;
  final void Function() onTap;
  bool isSelected;
}

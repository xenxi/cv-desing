import 'package:flutter/material.dart';

class NavbarDivider extends StatelessWidget {
  const NavbarDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(thickness: .8);
  }
}

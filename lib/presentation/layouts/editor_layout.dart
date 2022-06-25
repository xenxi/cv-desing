import 'package:flutter/material.dart';

class EditorLayout extends StatelessWidget {
  const EditorLayout({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

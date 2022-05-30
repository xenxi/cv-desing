import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:flutter/material.dart';

class TextCheck extends StatelessWidget {
  const TextCheck({
    Key? key,
    required this.label,
    this.textColor = Colors.white,
    this.iconColor = CustomTheme.primaryColor,
  }) : super(key: key);

  final String label;
  final Color textColor;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.check,
          color: iconColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          label,
          style:
              Theme.of(context).textTheme.headline6?.copyWith(color: textColor),
        )
      ],
    );
  }
}

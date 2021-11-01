import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';

class TextCheck extends StatelessWidget {
  final String label;

  const TextCheck({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check,
          color: CustomTheme.primaryColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(label,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white)),
        )
      ],
    );
  }
}

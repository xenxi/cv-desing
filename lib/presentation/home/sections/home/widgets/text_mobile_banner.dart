import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';

class TextMobileBanner extends StatelessWidget {
  final VoidCallback onButtonTap;
  const TextMobileBanner({
    Key? key,
    required this.onButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          Location.homeTitle,
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.5,
          ),
        ),
        const SizedBox(
          height: CustomTheme.defaultPadding,
        ),
        _checkListText(context, text: Location.homeSubtitle1),
        _checkListText(context, text: Location.homeSubtitle2),
        _checkListText(context, text: Location.homeSubtitle3),
        const SizedBox(
          height: CustomTheme.defaultPadding * 2,
        ),
        TextButton.icon(
            style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                primary: CustomTheme.secondaryColor,
                fixedSize: const Size(double.infinity, 50)),
            onPressed: onButtonTap,
            icon: const Icon(Icons.design_services),
            label: const Text(Location.start))
      ],
    );
  }

  Widget _checkListText(BuildContext context, {required String text}) => Row(
        children: [
          const Icon(
            Icons.check,
            color: CustomTheme.primaryColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white))
        ],
      );
}

import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';

class TextBanner extends StatelessWidget {
  final VoidCallback onButtonTap;
  const TextBanner({
    Key? key,
    required this.onButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FadeInDown(
          child: const Text(
            Location.homeTitle,
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(
          height: CustomTheme.defaultPadding,
        ),
        FadeInLeft(
            delay: const Duration(milliseconds: 300),
            child: _checkListText(context, text: Location.homeSubtitle1)),
        FadeInLeft(
            delay: const Duration(milliseconds: 500),
            child: _checkListText(context, text: Location.homeSubtitle2)),
        FadeInLeft(
            delay: const Duration(milliseconds: 700),
            child: _checkListText(context, text: Location.homeSubtitle3)),
        const SizedBox(
          height: CustomTheme.defaultPadding * 2,
        ),
        JelloIn(
          delay: const Duration(milliseconds: 1000),
          child: TextButton.icon(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  primary: CustomTheme.secondaryColor,
                  fixedSize: const Size(double.infinity, 50)),
              onPressed: onButtonTap,
              icon: const Icon(Icons.design_services),
              label: const Text(Location.start)),
        )
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

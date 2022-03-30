import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/sections/home/widgets/text_check.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';

class TextBanner extends StatelessWidget {
  const TextBanner({
    Key? key,
    required this.onButtonTap,
  }) : super(key: key);

  final VoidCallback onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FadeInDown(
          child: const FittedBox(
            child: Text(
              Location.homeTitle,
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: CustomTheme.defaultPadding,
        ),
        FittedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInLeft(
                delay: const Duration(milliseconds: 300),
                child: const TextCheck(label: Location.homeSubtitle1),
              ),
              FadeInLeft(
                delay: const Duration(milliseconds: 500),
                child: const TextCheck(label: Location.homeSubtitle2),
              ),
              FadeInLeft(
                delay: const Duration(milliseconds: 700),
                child: const TextCheck(label: Location.homeSubtitle3),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: CustomTheme.defaultPadding * 2,
        ),
        JelloIn(
          delay: const Duration(milliseconds: 1000),
          child: TextButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              primary: CustomTheme.secondaryColor,
              fixedSize: const Size(double.infinity, 50),
            ),
            onPressed: onButtonTap,
            icon: const Icon(Icons.design_services),
            label: const Text(Location.start),
          ),
        )
      ],
    );
  }
}

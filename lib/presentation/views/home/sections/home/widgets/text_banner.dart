import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/views/home/sections/home/widgets/text_check.dart';

class TextBanner extends StatelessWidget {
  const TextBanner({
    Key? key,
    required this.onButtonTap,
    this.textColor = Colors.white,
    this.iconColor = CustomTheme.primaryColor,
    this.buttonColor = CustomTheme.secondaryColor,
  }) : super(key: key);

  final VoidCallback onButtonTap;
  final Color textColor;
  final Color iconColor;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTitle(),
        const SizedBox(
          height: CustomTheme.defaultPadding,
        ),
        _buildCheckList(),
        const SizedBox(
          height: CustomTheme.defaultPadding * 2,
        ),
        _buildStartButton()
      ],
    );
  }

  Widget _buildTitle() => FadeInDown(
        child: FittedBox(
          child: Text(
            Location.homeTitle,
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: textColor,
              height: 1.5,
            ),
          ),
        ),
      );

  Widget _buildStartButton() => JelloIn(
        delay: const Duration(milliseconds: 1000),
        child: TextButton.icon(
          style: TextButton.styleFrom(
            backgroundColor: textColor,
            primary: buttonColor,
            fixedSize: const Size(double.infinity, 50),
          ),
          onPressed: onButtonTap,
          icon: const Icon(Icons.design_services),
          label: const Text(Location.start),
        ),
      );

  Widget _buildCheckList() => FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInLeft(
              delay: const Duration(milliseconds: 300),
              child: TextCheck(
                label: Location.homeSubtitle1,
                textColor: textColor,
                iconColor: iconColor,
              ),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 500),
              child: TextCheck(
                label: Location.homeSubtitle2,
                textColor: textColor,
                iconColor: iconColor,
              ),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 700),
              child: TextCheck(
                label: Location.homeSubtitle3,
                textColor: textColor,
                iconColor: iconColor,
              ),
            ),
          ],
        ),
      );
}

import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/adaptative_funtions.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.color,
    this.fontColor,
    this.trailing,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final Color color;
  final Color? fontColor;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: CustomTheme.defaultPadding),
      padding: const EdgeInsets.only(right: CustomTheme.defaultPadding),
      constraints: BoxConstraints(
        maxWidth: widthOfScreen(context),
      ),
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(context),
          const Spacer(),
          trailing ?? Container(),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final hasToFixSize = MediaQuery.of(context).size.width < 420;
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: CustomTheme.defaultPadding),
          padding: const EdgeInsets.only(bottom: 72),
          width: 8,
          height: 100,
          color: Theme.of(context).textTheme.headline1?.color,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: color,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              subTitle,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                color: fontColor,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: hasToFixSize ? 40 : null,
                    color: fontColor,
                  ),
            )
          ],
        ),
      ],
    );
  }
}

import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/adaptative_funtions.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.color,
    this.trailing,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final Color color;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: CustomTheme.defaultPadding),
      constraints: BoxConstraints(
        maxWidth: widthOfScreen(context),
      ),
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                ),
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Spacer(),
          trailing ?? Container(),
          const SizedBox(width: CustomTheme.defaultPadding),
        ],
      ),
    );
  }
}

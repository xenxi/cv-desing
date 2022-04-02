import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/feature_item.dart';
import 'package:flutter/material.dart';

class FeaturedDesingsList extends StatelessWidget {
  const FeaturedDesingsList({
    Key? key,
    required this.desings,
  }) : super(key: key);

  final List<Desing> desings;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        bottom: CustomTheme.defaultPadding,
        left: CustomTheme.defaultPadding,
        right: CustomTheme.defaultPadding,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: desings.length,
      itemBuilder: (context, index) => FeatureItem(desings[index]),
    );
  }
}

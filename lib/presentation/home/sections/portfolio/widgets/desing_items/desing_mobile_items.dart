import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/category_extensions.dart';
import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';

import 'desing_item.dart';

class DesingMobileItems extends StatelessWidget {
  final void Function(BuildContext context, {required Desing desing}) onItemTap;
  final List<Desing> desings;
  const DesingMobileItems({
    Key? key,
    required this.desings,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(CustomTheme.defaultPadding),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: desings.length,
      itemBuilder: (context, index) {
        final desing = desings[index];

        return SizedBox(
          height: heightOfScreen(context) * .5,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: DesingItem(
              title: desing.reference,
              subtitle: desing.category.displayName,
              imageUrl: desing.thumbnail(),
              onTap: () => onItemTap(context, desing: desing),
            ),
          ),
        );
      },
    );
  }
}

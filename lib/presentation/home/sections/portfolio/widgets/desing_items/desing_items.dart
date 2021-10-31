import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/category_extensions.dart';

import 'desing_item.dart';

class DesingItems extends StatelessWidget {
  final void Function(BuildContext context, {required Desing desing}) onItemTap;
  final List<Desing> desings;
  const DesingItems({
    Key? key,
    required this.onItemTap,
    required this.desings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildItemList(desings);
  }

  GridView _buildItemList(List<Desing> curriculumsData) => GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
          vertical: CustomTheme.defaultPadding,
          horizontal: CustomTheme.defaultPadding * 4),
      itemCount: curriculumsData.length,
      gridDelegate: _buildGridSize(),
      itemBuilder: (context, index) {
        return ElasticIn(
          delay: Duration(milliseconds: 100 * index),
          child: DesingItem(
            title: curriculumsData[index].reference,
            subtitle: curriculumsData[index].category.displayName,
            imageUrl: curriculumsData[index].thumbnail(),
            onTap: () => onItemTap(context, desing: curriculumsData[index]),
          ),
        );
      });

  SliverGridDelegateWithMaxCrossAxisExtent _buildGridSize() {
    return SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: .7,
        crossAxisSpacing: CustomTheme.defaultPadding * 2,
        mainAxisSpacing: CustomTheme.defaultPadding * 2);
  }
}

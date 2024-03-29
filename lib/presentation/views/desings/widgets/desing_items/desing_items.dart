import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/category_extensions.dart';
import 'package:cv_desing_website_flutter/presentation/views/desings/widgets/desing_items/desing_item.dart';
import 'package:flutter/material.dart';

class DesingItems extends StatelessWidget {
  const DesingItems({
    Key? key,
    required this.onItemTap,
    required this.desings,
  }) : super(key: key);

  final void Function(BuildContext context, {required Desing desing}) onItemTap;
  final List<Desing> desings;

  @override
  Widget build(BuildContext context) {
    return _buildItemList(desings);
  }

  GridView _buildItemList(List<Desing> curriculumsData) => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: curriculumsData.length,
        gridDelegate: _buildGridSize(),
        itemBuilder: (context, index) {
          final desing = curriculumsData[index];
          return FadeInDown(
            delay: Duration(milliseconds: 100 * index),
            child: DesingItem(
              title: desing.reference,
              subtitle: desing.category.displayName,
              imageUrl: desing.thumbnail(),
              priceWithDiscount: desing.priceWithDiscount,
              price: desing.price,
              onTap: () => onItemTap(context, desing: desing),
            ),
          );
        },
      );

  SliverGridDelegateWithMaxCrossAxisExtent _buildGridSize() {
    return const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 300,
      childAspectRatio: .7,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
    );
  }
}

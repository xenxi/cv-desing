import 'package:cv_desing_website_flutter/presentation/shared/components/category_extensions.dart';
import 'package:flutter/material.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'desing_mobile_item.dart';

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
    return CustomScrollView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
                [...desings.map((desing) => _buildItem(desing, context))]),
          )
        ]);
  }

  Widget _buildItem(Desing desing, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DesingMobileItem(
        height: 300,
        reference: desing.reference,
        subtitle: desing.category.displayName,
        imageUrl: desing.thumbnail(),
        onTap: () => onItemTap(context, desing: desing),
      ),
    );
  }
}

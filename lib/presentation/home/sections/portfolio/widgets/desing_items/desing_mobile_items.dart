import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:flutter/material.dart';

import 'desing_mobile_item.dart';

class DesingMobileItems extends StatelessWidget {
  const DesingMobileItems({
    Key? key,
    required this.desings,
    required this.onItemTap,
  }) : super(key: key);

  final void Function(BuildContext context, {required Desing desing}) onItemTap;
  final List<Desing> desings;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [...desings.map((desing) => _buildItem(desing, context))],
          ),
        )
      ],
    );
  }

  Widget _buildItem(Desing desing, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DesingMobileItem(
        height: 300,
        price: desing.price,
        reference: desing.reference,
        imageUrl: desing.thumbnail(),
        onTap: () => onItemTap(context, desing: desing),
      ),
    );
  }
}

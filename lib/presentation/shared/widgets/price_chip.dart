import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:flutter/material.dart';

class PriceChip extends StatelessWidget {
  const PriceChip({
    Key? key,
    required this.price,
    this.padding,
  }) : super(key: key);

  final double price;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final chip = Chip(
      backgroundColor: CustomTheme.errorColor,
      label: Text(
        '$price €',
        style: const TextStyle(color: Colors.white),
      ),
      elevation: 6,
    );

    return padding != null ? Padding(padding: padding!, child: chip) : chip;
  }
}

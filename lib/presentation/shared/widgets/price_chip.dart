import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:flutter/material.dart';

class PriceChip extends StatelessWidget {
  const PriceChip({
    Key? key,
    required this.price,
    this.priceWithDiscount,
    this.padding,
  }) : super(key: key);

  final double price;
  final double? priceWithDiscount;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final chip = _buildPrice(context);

    return padding != null ? Padding(padding: padding!, child: chip) : chip;
  }

  Widget _buildPrice(BuildContext context) {
    if (priceWithDiscount != null) return _buildPriceWithDiscount(context);

    return _buildNormalPrice();
  }

  Widget _buildPriceWithDiscount(BuildContext context) => Chip(
        backgroundColor: Colors.black,
        elevation: 6,
        label: RichText(
          text: TextSpan(
            text: '$price €',
            style: const TextStyle(
              color: CustomTheme.primaryText2,
              decoration: TextDecoration.lineThrough,
              fontSize: 12,
              decorationThickness: 3,
            ),
            children: [
              TextSpan(
                text: ' $priceWithDiscount €',
                style: const TextStyle(
                  fontSize: 18,
                  color: CustomTheme.errorColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildNormalPrice() => Chip(
        backgroundColor: CustomTheme.errorColor,
        label: Text(
          '$price €',
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 6,
      );
}

import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/launcher_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/email_address.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/price_chip.dart';
import 'package:flutter/material.dart';

class DesingMobileItem extends StatelessWidget {
  const DesingMobileItem({
    Key? key,
    required this.reference,
    required this.imageUrl,
    required this.price,
    required this.onTap,
    this.height,
    priceWithDiscount,
  }) : super(key: key);

  static final BorderRadius _cardBorderRadius = BorderRadius.circular(10);
  final String reference;
  final String imageUrl;
  final double price;
  final void Function() onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: _cardBorderRadius,
        child: _buildDismissibleItem(context),
      ),
    );
  }

  Widget _buildDismissibleItem(BuildContext context) => Dismissible(
        key: Key(reference),
        direction: DismissDirection.endToStart,
        confirmDismiss: (_) async => requestDesing(),
        background: Container(
          color: CustomTheme.secondaryColor,
          padding: const EdgeInsets.only(right: CustomTheme.defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ZoomIn(
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 40,
                  color: CustomTheme.primaryColor,
                ),
              ),
            ],
          ),
        ),
        child: _buildItem(context),
      );

  Widget _buildItem(BuildContext context) {
    return Container(
      height: height ?? double.infinity,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: _cardBorderRadius,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.0, .5), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          _buildProjectImage(context),
          Align(
            alignment: Alignment.topRight,
            child: PriceChip(
              price: price,
              padding: const EdgeInsets.all(CustomTheme.defaultPadding * .5),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> requestDesing() async {
    await openMail(EmailAddress.defaultAccount, subject: reference);
    return false;
  }

  Widget _buildProjectImage(BuildContext context) => Hero(
        tag: reference,
        child: ClipRRect(
          borderRadius: _cardBorderRadius,
          child: Image.asset(
            imageUrl,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
      );
}

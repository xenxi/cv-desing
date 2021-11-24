import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/launcher_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/email_address.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/price_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DesingItem extends HookWidget {
  const DesingItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.price,
    required this.onTap,
    this.priceWithDiscount,
  }) : super(key: key);

  static final BorderRadius _cardBorderRadius = BorderRadius.circular(10);
  static const Color _textColor = Colors.white;
  final String title;
  final String subtitle;
  final String imageUrl;
  final double price;
  final double? priceWithDiscount;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);
    return InkWell(
      onHover: (val) => isHover.value = val,
      onTap: onTap,
      child: ClipRRect(
        borderRadius: _cardBorderRadius,
        child: _buildItem(context, isHover: isHover.value),
      ),
    );
  }

  Widget _buildItem(BuildContext context, {required bool isHover}) {
    return Container(
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
          if (isHover) ...[
            Align(
              child: FlipInX(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: _cardBorderRadius,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        CustomTheme.secondaryColor.withOpacity(.2),
                        CustomTheme.secondaryColor.withOpacity(.7),
                        CustomTheme.secondaryColor.withOpacity(.8),
                        CustomTheme.secondaryColor.withOpacity(.7),
                        CustomTheme.secondaryColor.withOpacity(.2),
                      ],
                    ),
                  ),
                  child: _buildTextInfo(context),
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildTextInfo(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: _textColor),
        ),
        const SizedBox(
          height: CustomTheme.defaultPadding / 2,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: _textColor),
        ),
        const SizedBox(height: CustomTheme.defaultPadding),
        ElevatedButton.icon(
          onPressed: openEmail,
          icon: const Icon(Icons.info),
          label: const Text('Solicitar'),
        )
      ],
    );
  }

  Future<void> openEmail() =>
      openMail(EmailAddress.defaultAccount, subject: title);

  Widget _buildProjectImage(BuildContext context) => Hero(
        tag: title,
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

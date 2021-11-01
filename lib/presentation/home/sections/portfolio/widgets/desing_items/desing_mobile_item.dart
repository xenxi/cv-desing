import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/launcher_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/email_address.dart';

class DesingMobileItem extends StatelessWidget {
  static final BorderRadius _cardBorderRadius = BorderRadius.circular(10);
  static const Color _textColor = Colors.white;
  final String reference;
  final String subtitle;
  final String imageUrl;
  final void Function() onTap;
  final double? height;

  const DesingMobileItem({
    Key? key,
    required this.reference,
    required this.subtitle,
    required this.imageUrl,
    required this.onTap,
    this.height,
  }) : super(key: key);

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
      child: _buildItem(context));

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
        clipBehavior: Clip.hardEdge,
        children: [
          _buildProjectImage(context),
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

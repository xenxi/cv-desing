import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/close_button.dart';
import 'package:flutter/material.dart';

class BlackFridayBanner extends StatelessWidget {
  const BlackFridayBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CustomTheme.defaultBorderRadius),
      ),
      elevation: 8,
      insetAnimationCurve: Curves.elasticInOut,
      backgroundColor: Colors.black,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 550,
        ),
        height: 720,
        child: Padding(
          padding: const EdgeInsets.all(CustomTheme.defaultPadding),
          child: Stack(
            children: [
              ZoomIn(child: _buildBody(context)),
              FlipInX(child: _buildCloseButton()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton() => const Align(
        alignment: Alignment.topRight,
        child: RoundedCloseButton(),
      );

  Widget _buildBody(BuildContext context) => Center(
        child: Column(
          children: [
            const Spacer(),
            FittedBox(
              child: RichText(
                text: TextSpan(
                  text: 'Black'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.white),
                  children: [
                    TextSpan(
                      text: '\nFriday'.toUpperCase(),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FittedBox(
              child: Text(
                'Hasta un 45% de descuento en nuestros curriculums'
                    .toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white),
              ),
            ),
            FittedBox(
              child: Text(
                'No te lo pierdas'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white),
              ),
            ),
            const Spacer(),
            _buildMainButton(context),
            const Spacer(),
          ],
        ),
      );

  Widget _buildMainButton(BuildContext context) => FittedBox(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: CustomTheme.primaryColor,
            padding: const EdgeInsets.all(CustomTheme.paddingBigButton * 2),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Entrar'.toUpperCase(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      );
}

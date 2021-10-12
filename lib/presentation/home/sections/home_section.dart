import 'dart:ui';

import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomTheme.secondaryColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(CustomTheme.secondaryColor, BlendMode.color),
          image: const AssetImage(ImagePath.bg3),
        ),
      ),
      alignment: Alignment.center,
      width: widthOfScreen(context),
      height: heightOfScreen(context),
      child: Container(
        color: Colors.red,
        margin: EdgeInsets.only(top: CustomTheme.defaultPadding),
        child: SizedBox(
          width: 1200,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Logo(height: 60),
                  Spacer(),
                  _buildGlassContainer(context),
                  Spacer(
                    flex: 3,
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: _buildMainImage(),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildText(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainImage() {
    return Container(
      constraints: BoxConstraints(maxWidth: 639, maxHeight: 860),
      child: Image.asset(ImagePath.homeMainImage),
    );
  }

  Widget _buildGlassContainer(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(CustomTheme.defaultBorderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 600,
          width: 600,
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Impulsa el potencial de CV y destácate'),
          _checkListText(context,
              text: 'Elimina la molestia de escribir un CV'),
          _checkListText(context, text: 'Gran cantidad de diseños'),
          _checkListText(context, text: 'Obten tu CV en poco tiempo'),
        ],
      );

  Widget _checkListText(BuildContext context, {required String text}) => Row(
        children: [const Icon(Icons.check), Text(text)],
      );
}

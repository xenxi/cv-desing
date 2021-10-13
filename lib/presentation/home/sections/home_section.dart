import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/section.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeSection extends StatelessWidget {
  final VoidCallback goToProjectSection;
  const HomeSection({
    Key? key,
    required this.goToProjectSection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      decoration: BoxDecoration(
        color: CustomTheme.secondaryColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(CustomTheme.secondaryColor, BlendMode.hardLight),
          image: const AssetImage(ImagePath.bg7),
        ),
      ),
      child: ResponsiveBuilder(builder: (context, sizingInformation) {
        return SizedBox(
          width: sizingInformation.screenSize.width *
              (sizingInformation.isDesktop ? .7 : 1),
          child: _buildGlassContainer(
            context,
            children: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildText(context),
                      SizedBox(
                        height: CustomTheme.defaultPadding * 2,
                      ),
                      TextButton.icon(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              primary: CustomTheme.secondaryColor,
                              fixedSize: const Size(double.infinity, 50)),
                          onPressed: goToProjectSection,
                          icon: const Icon(Icons.design_services),
                          label: const Text('Empezar'))
                    ],
                  ),
                ),
                if (!sizingInformation.isMobile) ...[
                  SizedBox(
                    width: CustomTheme.defaultPadding * 2,
                  ),
                  Expanded(child: Image.asset(ImagePath.homeMainImage)),
                ],
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildGlassContainer(BuildContext context,
      {required Widget children}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(CustomTheme.defaultBorderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Padding(
          padding: EdgeInsets.all(CustomTheme.defaultPadding * 2),
          child: children,
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Impulsa el potencial de CV y destácate',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.5,
            ),
          ),
          SizedBox(
            height: CustomTheme.defaultPadding,
          ),
          _checkListText(context,
              text: 'Elimina la molestia de escribir un CV'),
          _checkListText(context, text: 'Gran cantidad de diseños'),
          _checkListText(context, text: 'Obten tu CV en poco tiempo'),
        ],
      );

  Widget _checkListText(BuildContext context, {required String text}) => Row(
        children: [
          Icon(
            Icons.check,
            color: CustomTheme.primaryColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white))
        ],
      );
}

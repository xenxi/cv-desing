import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/desing_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/not_found.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../shared/components/launcher_funtions.dart';
import '../shared/values/email_address.dart';

class DesingDetailsPage extends StatelessWidget {
  const DesingDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final desing = ModalRoute.of(context)?.settings.arguments as Desing?;
    final desing = ModalRoute.of(context)?.settings.arguments as Desing? ??
        DesingData.desings.first;

    if (desing == null) return const NotFound();

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Scaffold(
        body: SizedBox(
          height: heightOfScreen(context),
          child: Stack(
            children: [
              Image(
                height: double.infinity,
                width: double.infinity,
                image: AssetImage(
                  ImagePath.bg11,
                ),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.center,
                child: _buildImage(desing),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(CustomTheme.defaultPadding),
                  child: ClipOval(
                    child: Material(
                      color: CustomTheme.primaryColor,
                      child: IconButton(
                        onPressed: () => close(context),
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ),
                ),
              ),
              if (sizingInformation.isMobile)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: CustomTheme.defaultPadding),
                    child: ElevatedButton.icon(
                        onPressed: () =>
                            openEmail(context, subject: desing.reference),
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                        ),
                        label: const Text(
                          'Solicitar',
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                )
            ],
          ),
        ),
        floatingActionButton: sizingInformation.isMobile
            ? null
            : FloatingActionButton(
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
                backgroundColor: CustomTheme.primaryColor,
                onPressed: () => openEmail(context, subject: desing.reference),
              ),
      );
    });
  }

  Widget _buildImage(Desing desing) {
    return Center(
      child: Hero(
        tag: desing.reference,
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Image(
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            image: AssetImage(
              desing.image(),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> openEmail(BuildContext context,
      {required String subject}) async {
    await openMail(EmailAddress.defaultAccount, subject: subject);
    close(context);
  }

  void close(BuildContext context) {
    Navigator.of(context).pop();
  }
}

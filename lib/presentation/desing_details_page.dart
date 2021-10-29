import 'dart:js';

import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/section.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/desing_data.dart';
import 'package:flutter/material.dart';

import 'shared/components/launcher_funtions.dart';
import 'shared/values/email_address.dart';

class DesingDetailsPage extends StatelessWidget {
  const DesingDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final desing = ModalRoute.of(context)?.settings.arguments as Desing;
    final desing = DesingData.desings.first;

    return Scaffold(
      // appBar: AppBar(),
      body: SizedBox(
        height: heightOfScreen(context),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Hero(
                tag: desing.reference,
                child: Image(
                  height: double.infinity,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                    desing.image(),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => close(context),
                icon: const Icon(Icons.close),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.shop,
          color: Colors.white,
        ),
        backgroundColor: CustomTheme.primaryColor,
        onPressed: () => openEmail(context, subject: desing.reference),
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

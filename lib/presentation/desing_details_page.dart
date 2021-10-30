import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:flutter/material.dart';

import 'shared/components/launcher_funtions.dart';
import 'shared/values/email_address.dart';

class DesingDetailsPage extends StatelessWidget {
  const DesingDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final desing = ModalRoute.of(context)?.settings.arguments as Desing?;

    if (desing == null) return notFound(context);

    return Scaffold(
      body: SizedBox(
        height: heightOfScreen(context),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: _buildImage(desing),
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

  Hero _buildImage(Desing desing) {
    return Hero(
      tag: desing.reference,
      child: Image(
        height: double.infinity,
        alignment: Alignment.topCenter,
        fit: BoxFit.fitHeight,
        image: AssetImage(
          desing.image(),
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

  Widget notFound(BuildContext context) {
    return Container(
      color: CustomTheme.secondaryColor,
      padding: EdgeInsets.all(CustomTheme.defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            color: CustomTheme.errorColor,
            size: 100,
          ),
          SizedBox(
            height: CustomTheme.defaultPadding,
          ),
          Text(
            'No se ha encontrado el recurso que buscaba',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: CustomTheme.errorColor),
          ),
          SizedBox(
            height: CustomTheme.defaultPadding * 2,
          ),
          OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(10.0),
                side: BorderSide(width: 1.0, color: CustomTheme.errorColor),
              ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, AppRouter.home),
              icon: Icon(Icons.refresh, color: CustomTheme.errorColor),
              label: Text(
                'Ir al menu',
                style: TextStyle(color: CustomTheme.errorColor),
              ))
        ],
      ),
    );
  }
}

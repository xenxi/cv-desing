import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/desing_details/widgets/close_button.dart';
import 'package:cv_desing_website_flutter/presentation/desing_details/widgets/details_mockup.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/desing_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/not_found.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../shared/components/launcher_funtions.dart';
import '../shared/values/email_address.dart';

class DesingDetailsPage extends StatelessWidget {
  const DesingDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final desing = ModalRoute.of(context)?.settings.arguments as Desing?;
    // final desing = ModalRoute.of(context)?.settings.arguments as Desing? ??
    //     DesingData.desings.first;

    if (desing == null) return const NotFound();

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Scaffold(
        body: SizedBox(
          height: heightOfScreen(context),
          child: Stack(
            children: [
              DetailMockUp(child: _buildImage(desing)),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: EdgeInsets.all(CustomTheme.defaultPadding),
                    child: const RoundedCloseButton()),
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
                          Location.requestDesing,
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
                tooltip: Location.requestDesing,
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

  Image _buildImage(Desing desing) => Image(
        alignment: Alignment.topCenter,
        fit: BoxFit.cover,
        image: AssetImage(
          desing.image(),
        ),
      );

  Future<void> openEmail(BuildContext context,
      {required String subject}) async {
    await openMail(EmailAddress.defaultAccount, subject: subject);
    Navigator.of(context).pop();
  }
}

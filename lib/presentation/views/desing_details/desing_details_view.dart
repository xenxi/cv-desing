import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/adaptative_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/close_button.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/not_found.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_details/widgets/details_mockup.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_details/widgets/request_button.dart';
import 'package:flutter/material.dart';

class DesingDetailsView extends StatelessWidget {
  const DesingDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final desing = ModalRoute.of(context)?.settings.arguments as Desing?;
    // final desing = ModalRoute.of(context)?.settings.arguments as Desing? ??
    //     DesingData.desings.first;

    if (desing == null) return const NotFound();

    return SizedBox(
      height: heightOfScreen(context),
      child: Stack(
        children: [
          DetailMockUp(child: _buildImage(desing)),
          const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(CustomTheme.defaultPadding),
              child: RoundedCloseButton(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: CustomTheme.defaultPadding,
              ),
              child: RequestButton(
                reference: desing.reference,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImage(Desing desing) => Hero(
        tag: desing.reference,
        child: Image(
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          image: AssetImage(
            desing.image(),
          ),
        ),
      );
}
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/section.dart';
import 'package:flutter/material.dart';

class DesingDetailsPage extends StatelessWidget {
  const DesingDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final desing = ModalRoute.of(context)?.settings.arguments as Desing;

    return Scaffold(
      appBar: AppBar(),
      body: Section(
        child: Image(
          height: heightOfScreen(context),
          alignment: Alignment.topCenter,
          fit: BoxFit.fitHeight,
          image: AssetImage(
            desing.image(),
          ),
        ),
      ),
    );
  }
}

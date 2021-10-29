import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:flutter/material.dart';

class DesingDetailsPage extends StatelessWidget {
  const DesingDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final desing = ModalRoute.of(context)?.settings.arguments as Desing;

    return Container(
      child: Center(
        child: Text(desing.reference),
      ),
    );
  }
}

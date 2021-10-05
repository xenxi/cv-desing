import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CV"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.red),
        width: widthOfScreen(context),
        height: heightOfScreen(context),
        child: ListView(
          children: [
            Wrap(
              direction: Axis.horizontal,
              spacing: assignWidth(context: context, fraction: 0.0099),
              runSpacing: assignHeight(context: context, fraction: 0.02),
            )
          ],
        ),
      ),
    );
  }
}

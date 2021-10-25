import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';
import 'package:flutter/material.dart';

class ComingSoonLogo extends StatelessWidget {
  const ComingSoonLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: FlipInY(
          delay: const Duration(milliseconds: 700),
          child: Logo(
            height: MediaQuery.of(context).size.height * .4,
            minHeight: 250,
            onTap: () {},
            // color: Colors.amberAccent,
          ),
        ),
      ),
    );
  }
}

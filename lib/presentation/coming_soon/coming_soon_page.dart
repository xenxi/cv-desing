import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo_widget.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links_widget.dart';
import 'package:flutter/material.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logoHeight = size.height * .4;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 31, 32, 1),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: size.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogoBody(logoHeight),
              ..._buildText(context),
              const SizedBox(
                height: 20,
              ),
              const SocialLinksWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoBody(double logoHeight) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: FlipInY(
          delay: const Duration(milliseconds: 700),
          child: LogoWidget(
            height: logoHeight,
            minHeight: 250,
            // color: Colors.amberAccent,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildText(BuildContext context) => [
        Center(
            child: FadeInLeft(
          child: Text(
            'Oops...',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: const Color.fromRGBO(194, 162, 126, 1)),
          ),
        )),
        Center(
            child: FadeInRight(
          delay: const Duration(milliseconds: 500),
          child: Text(
            'En construcción',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: const Color.fromRGBO(194, 162, 126, 1)),
          ),
        )),
      ];
}

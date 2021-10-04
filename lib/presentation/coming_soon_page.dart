import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
              _buildSocialLinks(context),
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

  Widget _buildSocialLinks(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElasticIn(
            delay: const Duration(milliseconds: 1000),
            child: _buildSocialLinkButton(context,
                icon: FontAwesomeIcons.envelope,
                onPressed: () async => await _launchURL(
                    'mailto:dscurriculumvitae@gmail.com?subject=Información web')),
          ),
          ElasticIn(
            delay: const Duration(milliseconds: 1500),
            child: _buildSocialLinkButton(context,
                icon: FontAwesomeIcons.instagram,
                onPressed: () async => await _launchURL(
                    'https://www.instagram.com/dscurriculumvitae')),
          ),
          ElasticIn(
            delay: const Duration(milliseconds: 2000),
            child: _buildSocialLinkButton(context,
                icon: FontAwesomeIcons.tiktok,
                onPressed: () async => await _launchURL(
                    'https://www.tiktok.com/@dscurriculumvitae')),
          ),
        ],
      );

  Future<void> _launchURL(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  Widget _buildSocialLinkButton(BuildContext context,
          {required IconData icon, required void Function() onPressed}) =>
      IconButton(
        onPressed: onPressed,
        icon: FaIcon(icon),
        color: const Color.fromRGBO(194, 162, 126, 1),
      );
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
  }

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

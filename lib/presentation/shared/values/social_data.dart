import 'package:cv_desing_website_flutter/presentation/shared/social_links/social_button_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialData {
  static final links = [
    SocialButtonData(
      tag: 'TWITTER_URL',
      iconData: FontAwesomeIcons.twitter,
      url: 'TWITTER_URL',
    ),
    SocialButtonData(
      tag: 'FACEBOOK_URL',
      iconData: FontAwesomeIcons.facebook,
      url: 'FACEBOOK_URL',
    ),
    SocialButtonData(
      tag: 'LINKED_IN_URL',
      iconData: FontAwesomeIcons.linkedin,
      url: 'LINKED_IN_URL',
    ),
    SocialButtonData(
      tag: 'INSTAGRAM_URL',
      iconData: FontAwesomeIcons.instagram,
      url: 'INSTAGRAM_URL',
    ),
  ];
}

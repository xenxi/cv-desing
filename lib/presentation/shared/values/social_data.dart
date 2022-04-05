import 'package:cv_desing_website_flutter/presentation/shared/components/launcher_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links/social_button_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/email_address.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialData {
  static final links = [
    SocialButtonData(
      tag: 'EMAIL_ADDRESS',
      iconData: FontAwesomeIcons.envelope,
      onPressed: () => openMail(
        EmailAddress.defaultAccount,
        subject: 'Información web',
      ),
    ),
    SocialButtonData(
      tag: 'INSTAGRAM_URL',
      iconData: FontAwesomeIcons.instagram,
      onPressed: () =>
          openUrlLink('https://www.instagram.com/dscurriculumvitae'),
    ),
    SocialButtonData(
      tag: 'TIKTOK_URL',
      iconData: FontAwesomeIcons.tiktok,
      onPressed: () => openUrlLink('https://www.tiktok.com/@dscurriculumvitae'),
    ),
  ];
}

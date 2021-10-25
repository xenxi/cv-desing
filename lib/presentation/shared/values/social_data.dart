import 'package:cv_desing_website_flutter/presentation/shared/components/launcher_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links/social_button_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'email_address.dart';

class SocialData {
  static final links = [
    SocialButtonData(
      tag: 'EMAIL_ADDRESS',
      iconData: FontAwesomeIcons.envelope,
      onPressed: () async => await openMail(EmailAddress.defaultAccount,
          subject: 'Información web'),
    ),
    SocialButtonData(
      tag: 'INSTAGRAM_URL',
      iconData: FontAwesomeIcons.instagram,
      onPressed: () async =>
          await openUrlLink('https://www.instagram.com/dscurriculumvitae'),
    ),
    SocialButtonData(
        tag: 'TIKTOK_URL',
        iconData: FontAwesomeIcons.tiktok,
        onPressed: () async =>
            await openUrlLink('https://www.tiktok.com/@dscurriculumvitae')),
  ];
}

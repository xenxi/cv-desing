import 'dart:typed_data';

import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/academy_training.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/complementary_training.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/contact_information.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/personal_information.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/social_media.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/work_experience.dart';
import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/course_hours.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/description.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/employer.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/languages.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/locality.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/name.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/percentage.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/phone_number.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/schoold.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/skills.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/software_skill.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/unique_id.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/url.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

class ExampleResumeData {
  ExampleResumeData({Uint8List? avatar}) : jonDoe = _create(avatar);
  final Resume jonDoe;
  static Resume _create(Uint8List? avatar) => Resume(
        personalInformation: PersonalInformation(
          locality: Locality(
            '568 Port Washington Road Nordegg, AB T0M 2H0 FCanada, ON',
          ),
          name: Name('Johnson Dóe'),
          job: Job('Mechanical Technicían'),
          description: Description(
            'A hard-working mechanic for 2 big-time energy factories. Familiar in repair and safety standards. Has experience in various repair and maintenance works.F',
          ),
          avatarOption: optionOf(avatar),
        ),
        contactInformation: ContactInformation(
          emailAddress: EmailAddress('jonDoe@gmail.com'),
          phoneNumber: PhoneNumber('+1 (403) 555-1212'),
          socialMedias: SocialMedias(
            facebookOption: some(Url('https://www.facebook.com/jonDoe')),
            linkedinOption: some(Url('https://www.linkedin.com/in/jonDoe')),
            twitterOption: some(Url('https://twitter.com/jonDoe')),
            githubOption: some(Url('https://github.com/jonDoe')),
            instagramOption: some(Url('https://www.instagram.com/jonDoe')),
            personalOption: some(Url('https://www.jonDoe.com')),
            twitchOption: some(Url('https://www.twitch.com/jonDoe')),
            youtubeOption: some(Url('https://www.youtube.com/jonDoe')),
          ),
        ),
        academyTrainings: AcademyTrainings([
          AcademyTraining(
            title: Title('Bachelor in mechanical engineering'),
            schoold: Schoold('University of kansas'),
            dateRange: DateRange(since: DateTime.now(), until: null),
            uniqueId: UniqueId(),
          ),
          AcademyTraining(
            title: Title('High school'),
            schoold: Schoold('Stevens high school'),
            dateRange: DateRange(
                since: DateTime.now().subtract(const Duration(days: 200)),
                until: DateTime.now()),
            uniqueId: UniqueId(),
          ),
          AcademyTraining(
            title: Title('Elementary school'),
            schoold: Schoold('Saint anns high school'),
            dateRange: DateRange(
                since: DateTime.now().subtract(const Duration(days: 200)),
                until: DateTime.now()),
            uniqueId: UniqueId(),
          ),
        ]),
        complementaryTrainings: ComplementaryTrainings([
          ComplementaryTraining(
            title: Title('Cerfiticate in mechanical engineering'),
            schoold: Schoold('Saint anns'),
            dateRange: DateRange(
                since: DateTime.now(),
                until: DateTime.now().add(const Duration(days: 4))),
            uniqueId: UniqueId(),
            courseHoursOption: some(CourseHours(30)),
          ),
          ComplementaryTraining(
              title: Title('certificate in software engineering'),
              schoold: Schoold('Saint anns'),
              dateRange: DateRange(
                  since: DateTime.now(),
                  until: DateTime.now().add(const Duration(days: 4))),
              uniqueId: UniqueId(),
              courseHoursOption: none()),
        ]),
        workExperiences: WorkExperiences([
          WorkExperience(
            job: Job('Mechanical Technician'),
            employer: Employer('Atomic power solutions'),
            dateRange: DateRange(since: DateTime.now(), until: null),
            uniqueId: UniqueId(),
            description: Description(
                'Inspects, maintains and repairs the power tools in the factory. Cleans the parts and pieces of the power tools and lubricates them.'),
          ),
          WorkExperience(
            job: Job('Deepfields energies'),
            employer: Employer('Atomic power solutions'),
            dateRange: DateRange(since: DateTime.now(), until: null),
            uniqueId: UniqueId(),
            description: Description(
                'Perform monthly diagnosis of hardware equipments. Worked nightshift every 2 monthos for on call duties.'),
          ),
        ]),
        languages: Languages([
          Language('English', level: LanguageLevel.beginner),
          Language('Espanish', level: LanguageLevel.intermediate),
        ]),
        softwareSkills: SoftwareSkills([
          SoftwareSkill('Word', percentage: Percentage(100)),
          SoftwareSkill('Excel', percentage: Percentage(10)),
          SoftwareSkill('Powerpoint', percentage: Percentage(50)),
        ]),
        skills: const Skills([
          'Mechanical',
          'Repair',
          'Safety',
        ]),
      );

  static Future<Uint8List> loadAvatar() async {
    final bytes = await rootBundle.load(ImagePath.jonDoe);
    return bytes.buffer.asUint8List();
  }
}

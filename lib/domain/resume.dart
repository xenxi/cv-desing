import 'package:cv_desing_website_flutter/domain/academy_training.dart';
import 'package:cv_desing_website_flutter/domain/complementary_training.dart';
import 'package:cv_desing_website_flutter/domain/contact_information.dart';
import 'package:cv_desing_website_flutter/domain/personal_information.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/languages.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/skills.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/software_skill.dart';
import 'package:cv_desing_website_flutter/domain/work_experience.dart';
import 'package:equatable/equatable.dart';

class Resume extends Equatable {
  const Resume(
    this.personalInformation,
    this.contactInformation,
    this.academyTraining,
    this.complementaryTraining,
    this.workExperience,
    this.languages,
    this.softwareSkills,
    this.skills,
  );

  final PersonalInformation personalInformation;
  final ContactInformation contactInformation;
  final AcademyTraining academyTraining;
  final ComplementaryTraining complementaryTraining;
  final WorkExperience workExperience;
  final Languages languages;
  final SoftwareSkills softwareSkills;
  final Skills skills;
  @override
  List<Object?> get props => [
        personalInformation,
        contactInformation,
        academyTraining,
        complementaryTraining,
        workExperience,
        languages,
        softwareSkills,
        skills,
      ];
}

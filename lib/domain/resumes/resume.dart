import 'package:cv_desing_website_flutter/domain/resumes/entities/academy_training.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/complementary_training.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/contact_information.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/personal_information.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/work_experience.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/languages.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/skills.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/software_skill.dart';
import 'package:equatable/equatable.dart';

class Resume extends Equatable {
  factory Resume.empty() => Resume(
        personalInformation: PersonalInformation.empty(),
        contactInformation: ContactInformation.empty(),
        academyTrainings: AcademyTrainings.empty(),
        complementaryTrainings: ComplementaryTrainings.empty(),
        workExperiences: WorkExperiences.empty(),
        languages: Languages.empty(),
        softwareSkills: SoftwareSkills.empty(),
        skills: Skills.empty(),
      );
  const Resume({
    required this.personalInformation,
    required this.contactInformation,
    required this.academyTrainings,
    required this.complementaryTrainings,
    required this.workExperiences,
    required this.languages,
    required this.softwareSkills,
    required this.skills,
  });

  final PersonalInformation personalInformation;
  final ContactInformation contactInformation;
  final AcademyTrainings academyTrainings;
  final ComplementaryTrainings complementaryTrainings;
  final WorkExperiences workExperiences;
  final Languages languages;
  final SoftwareSkills softwareSkills;
  final Skills skills;
  @override
  List<Object?> get props => [
        personalInformation,
        contactInformation,
        academyTrainings,
        complementaryTrainings,
        workExperiences,
        languages,
        softwareSkills,
        skills,
      ];

  Resume copyWith({
    PersonalInformation? personalInformation,
    ContactInformation? contactInformation,
    AcademyTrainings? academyTrainings,
    ComplementaryTrainings? complementaryTrainings,
    WorkExperiences? workExperiences,
    Languages? languages,
    SoftwareSkills? softwareSkills,
    Skills? skills,
  }) {
    return Resume(
      personalInformation: personalInformation ?? this.personalInformation,
      contactInformation: contactInformation ?? this.contactInformation,
      academyTrainings: academyTrainings ?? this.academyTrainings,
      complementaryTrainings:
          complementaryTrainings ?? this.complementaryTrainings,
      workExperiences: workExperiences ?? this.workExperiences,
      languages: languages ?? this.languages,
      softwareSkills: softwareSkills ?? this.softwareSkills,
      skills: skills ?? this.skills,
    );
  }
}

import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';

extension SectionExtension on Section {
  String get displayName {
    switch (this) {
      case Section.personalInformation:
        return Location.personalInformation;
      case Section.contactInformation:
        return Location.conactInformation;
      case Section.academicTraining:
        return Location.academicTraining;
      case Section.complementaryFormations:
        return Location.complementaryFormations;
      case Section.workExperience:
        return Location.workExperience;
      case Section.languages:
        return Location.languages;
      case Section.softwareSkills:
        return Location.softwareSkills;
      case Section.skillsandAptitudes:
        return Location.skillsandAptitudes;
      default:
        return '';
    }
  }

  Widget get icon {
    switch (this) {
      case Section.personalInformation:
        return const Icon(Icons.person_outline);
      case Section.contactInformation:
        return const Icon(Icons.email_outlined);
      case Section.academicTraining:
        return const Icon(Icons.school_outlined);
      case Section.complementaryFormations:
        return const Icon(Icons.title_outlined);
      case Section.workExperience:
        return const Icon(Icons.work_outline);
      case Section.languages:
        return const Icon(Icons.language_outlined);
      case Section.softwareSkills:
        return const Icon(Icons.featured_play_list_outlined);
      case Section.skillsandAptitudes:
        return const Icon(Icons.article_outlined);
    }
  }
}

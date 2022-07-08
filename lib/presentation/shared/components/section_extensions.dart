import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';

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
}

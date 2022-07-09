import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/academic_training_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/complementary_formations_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/contact_info_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/languages_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/personal_info_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/skills_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/software_skills_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/work_experience_form.dart';
import 'package:flutter/material.dart';

class FormStepBuilder extends Step {
  const FormStepBuilder({required Widget title, required Widget content})
      : super(title: title, content: content);

  factory FormStepBuilder.fromSection(Section section) {
    return FormStepBuilder(
      title: Text(_buildTitle(section)),
      content: _buildContent(section),
    );
  }

  static String _buildTitle(Section section) {
    switch (section) {
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

  static Widget _buildContent(Section section) {
    switch (section) {
      case Section.personalInformation:
        return const PersonalInfoForm();
      case Section.contactInformation:
        return const ContactInfoForm();
      case Section.academicTraining:
        return const AcademicTrainingForm();
      case Section.complementaryFormations:
        return const ComplementaryFormationsForm();
      case Section.workExperience:
        return const WorkExperienceForm();
      case Section.languages:
        return const LanguagesForm();
      case Section.softwareSkills:
        return const SoftwareSkillsForm();
      case Section.skillsandAptitudes:
        return SkillsForm();
    }
  }
}

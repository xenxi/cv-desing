import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/section_extensions.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/academic_training_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/complementary_formations_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/contact_info_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/languages_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/personal_information_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/skills_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/software_skills_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/work_experience_form.dart';
import 'package:flutter/material.dart';

class FormStepBuilder extends Step {
  const FormStepBuilder({required Widget title, required Widget content})
      : super(title: title, content: content);

  factory FormStepBuilder.fromSection(Section section) {
    return FormStepBuilder(
      title: Text(section.displayName),
      content: _buildContent(section),
    );
  }

  static Widget _buildContent(Section section) {
    switch (section) {
      case Section.personalInformation:
        return const PersonalInformationForm();
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

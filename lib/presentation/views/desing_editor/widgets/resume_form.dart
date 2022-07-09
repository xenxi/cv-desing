import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/application/navigation/navigation_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/section_extensions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/academic_training_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/complementary_formations_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/contact_info_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/languages_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/personal_info_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/skills_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/software_skills_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/work_experience_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResumeForm extends StatelessWidget {
  const ResumeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CvEditorBloc, CvEditorState>(
      builder: (context, state) {
        return Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: CustomTheme.batmanGradient,
                ),
              ),
              width: 200,
              child: Column(
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  Logo(
                    height: 120,
                    onTap: () => BlocProvider.of<NavigationBloc>(context)
                        .add(const HomeOpened()),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  ...Section.values.map(
                    (e) => _buildStepTitle(
                      context,
                      section: e,
                      selected: state.section == e,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: _buildForm(state.section),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildStepTitle(
    BuildContext context, {
    required Section section,
    required bool selected,
  }) {
    return InkWell(
      onTap: () => _updateSection(context, section: section),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: selected ? Colors.white24 : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: CustomTheme.primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: _buildStepIcon(section),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    section.displayName,
                    style: const TextStyle(color: CustomTheme.primaryText1),
                  ),
                )
              ],
            ),
          ),
          if (Section.values.indexOf(section) < Section.values.length - 1)
            Transform.scale(
              scaleY: 2,
              child: Container(
                padding: const EdgeInsets.only(left: 17),
                height: 20,
                child: const VerticalDivider(
                  thickness: 3,
                  color: CustomTheme.primaryColor,
                ),
              ),
            )
        ],
      ),
    );
  }

  void _updateSection(BuildContext context, {required Section section}) =>
      BlocProvider.of<CvEditorBloc>(context)
          .add(SectionChanged(section: section));

  Widget _buildForm(Section section) {
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

  Widget _buildStepIcon(Section section) {
    switch (section) {
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

import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/academic_training_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/complementary_formations_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/contact_info_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/form_step_builder.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/languages_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/personal_info_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/skills_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/software_skills_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/work_experience_form.dart';
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
              color: Colors.red,
              width: 200,
              child: Column(
                children: [
                  const Logo(height: 120),
                  const SizedBox(
                    height: 22,
                  ),
                  ...Section.values.map(
                    (e) => _buildStepTitle(context,
                        section: e, selected: state.section == e),
                  )
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: _buildForm(state.section),
            ))
          ],
        );
        return Stepper(
          controlsBuilder: (context, details) {
            return Container();
          },
          currentStep: _getCurrentStepFrom(state),
          onStepTapped: (index) => _updateSelectedSection(context, index),
          steps: [..._buildStepForms()],
        );
      },
    );
  }

  Widget _buildStepTitle(BuildContext context,
      {required Section section, required bool selected}) {
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
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(Icons.telegram),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text('$section'),
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
                  color: Colors.black,
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
  void _updateSelectedSection(BuildContext context, int index) =>
      BlocProvider.of<CvEditorBloc>(context)
          .add(SectionChanged(section: Section.values[index]));

  int _getCurrentStepFrom(CvEditorState state) =>
      Section.values.indexOf(state.section);

  Iterable<Step> _buildStepForms() => Section.values.map(
        (section) => FormStepBuilder.fromSection(section),
      );

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
}

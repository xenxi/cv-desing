import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
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

class FormBuilder extends StatelessWidget {
  const FormBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final section = BlocProvider.of<CvEditorBloc>(context).state.section;
    final controller =
        PageController(initialPage: Section.values.indexOf(section));

    return BlocListener<CvEditorBloc, CvEditorState>(
      listenWhen: (previous, current) => previous.section != current.section,
      listener: (context, state) async {
        controller.jumpToPage(Section.values.indexOf(state.section));
      },
      child: PageView(
        scrollDirection: Axis.vertical,
        controller: controller,
        onPageChanged: (index) => BlocProvider.of<CvEditorBloc>(context)
            .add(SectionChanged(section: Section.values[index])),
        children: [
          const PersonalInfoForm(),
          const ContactInfoForm(),
          const AcademicTrainingForm(),
          const ComplementaryFormationsForm(),
          const WorkExperienceForm(),
          const LanguagesForm(),
          const SoftwareSkillsForm(),
          SkillsForm(),
        ],
      ),
    );
  }
}

import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/academic_training_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/contact_info_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/personal_info_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DesingEditorView extends HookWidget {
  const DesingEditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CveditorBloc>(),
      child: BlocBuilder<CveditorBloc, CveditorState>(
        builder: (context, state) {
          return Stepper(
            currentStep: Section.values.indexOf(state.section),
            onStepTapped: (index) => BlocProvider.of<CveditorBloc>(context)
                .add(SectionChanged(section: Section.values[index])),
            steps: _buildStepForms(),
          );
        },
      ),
    );
  }

  List<Step> _buildStepForms() {
    return Section.values
        .map(
          (section) => Step(
            title: Text(_buildTitle(section)),
            content: _buildStepContent(section),
          ),
        )
        .toList();
  }

  String _buildTitle(Section section) {
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

  Widget _buildStepContent(Section section) {
    switch (section) {
      case Section.personalInformation:
        return const PersonalInfoForm();
      case Section.contactInformation:
        return const ContactInfoForm();
      case Section.academicTraining:
        return const AcademicTrainingForm();
      case Section.complementaryFormations:
        // TODO: Handle this case.
        break;
      case Section.workExperience:
        // TODO: Handle this case.
        break;
      case Section.languages:
        // TODO: Handle this case.
        break;
      case Section.softwareSkills:
        // TODO: Handle this case.
        break;
      case Section.skillsandAptitudes:
        // TODO: Handle this case.
        break;
    }

    return const Text('TODO');
  }
}

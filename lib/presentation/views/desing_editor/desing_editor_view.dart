import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
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
            steps: const [
              Step(
                title: Text(Location.personalInformation),
                content: PersonalInfoForm(),
              ),
              Step(
                title: Text(Location.academicTraining),
                content: Text('Content for Step 2'),
              ),
              Step(
                title: Text(Location.complementaryFormations),
                content: Text('Content for Step 2'),
              ),
              Step(
                title: Text(Location.workExperience),
                content: Text('Content for Step 2'),
              ),
              Step(
                title: Text(Location.languages),
                content: Text('Content for Step 2'),
              ),
              Step(
                title: Text(Location.softwareSkills),
                content: Text('Content for Step 2'),
              ),
              Step(
                title: Text(Location.skillsandAptitudes),
                content: Text('Content for Step 2'),
              ),
            ],
          );
        },
      ),
    );
  }
}

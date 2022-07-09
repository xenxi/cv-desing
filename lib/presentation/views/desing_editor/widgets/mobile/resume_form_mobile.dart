import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/mobile/form_step_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResumeFormMobile extends StatelessWidget {
  const ResumeFormMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CvEditorBloc, CvEditorState>(
      builder: (context, state) {
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

  void _updateSelectedSection(BuildContext context, int index) =>
      BlocProvider.of<CvEditorBloc>(context)
          .add(SectionChanged(section: Section.values[index]));

  int _getCurrentStepFrom(CvEditorState state) =>
      Section.values.indexOf(state.section);

  Iterable<Step> _buildStepForms() => Section.values.map(
        (section) => FormStepBuilder.fromSection(section),
      );
}

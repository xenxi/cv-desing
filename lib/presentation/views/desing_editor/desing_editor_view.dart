import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/adaptative_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/form_step_builder.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/resume_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DesingEditorView extends HookWidget {
  const DesingEditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CvEditorBloc>(),
      child: isMobileScreen(context)
          ? Column(
              children: [
                _buildForm(),
                const SizedBox(height: 9),
                _buildPreview(),
              ],
            )
          : Row(
              children: [
                _buildForm(),
                _buildPreview(),
              ],
            ),
    );
  }

  BlocBuilder<CvEditorBloc, CvEditorState> _buildPreview() {
    return BlocBuilder<CvEditorBloc, CvEditorState>(
      buildWhen: (previous, current) => previous.resume != current.resume,
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ResumePreview(
                  resume: state.resume,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  BlocBuilder<CvEditorBloc, CvEditorState> _buildForm() {
    return BlocBuilder<CvEditorBloc, CvEditorState>(
      builder: (context, state) {
        return Expanded(
          child: Stepper(
            controlsBuilder: (context, details) {
              return Container();
            },
            currentStep: _getCurrentStepFrom(state),
            onStepTapped: (index) => _updateSelectedSection(context, index),
            steps: _buildStepForms(),
          ),
        );
      },
    );
  }

  void _updateSelectedSection(BuildContext context, int index) =>
      BlocProvider.of<CvEditorBloc>(context)
          .add(SectionChanged(section: Section.values[index]));

  int _getCurrentStepFrom(CvEditorState state) =>
      Section.values.indexOf(state.section);

  List<Step> _buildStepForms() => Section.values
      .map(
        (section) => FormStepBuilder.fromSection(section),
      )
      .toList();
}

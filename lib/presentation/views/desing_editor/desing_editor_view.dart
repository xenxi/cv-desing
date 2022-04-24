import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/form_step_builder.dart';
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
            currentStep: _getCurrentStepFrom(state),
            onStepTapped: (index) => _updateSelectedSection(context, index),
            steps: _buildStepForms(),
          );
        },
      ),
    );
  }

  void _updateSelectedSection(BuildContext context, int index) =>
      BlocProvider.of<CveditorBloc>(context)
          .add(SectionChanged(section: Section.values[index]));

  int _getCurrentStepFrom(CveditorState state) =>
      Section.values.indexOf(state.section);

  List<Step> _buildStepForms() => Section.values
      .map(
        (section) => FormStepBuilder.fromSection(section),
      )
      .toList();
}

import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
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
              steps: [
                Step(
                  title: const Text('Información personal y contacto'),
                  content: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Content for Step 1')),
                ),
                const Step(
                  title: Text('Formación académica'),
                  content: Text('Content for Step 2'),
                ),
                const Step(
                  title: Text('Formaciones complementarias'),
                  content: Text('Content for Step 2'),
                ),
                const Step(
                  title: Text('Experiencia laboral'),
                  content: Text('Content for Step 2'),
                ),
                const Step(
                  title: Text('Idiomas'),
                  content: Text('Content for Step 2'),
                ),
                const Step(
                  title: Text('Software y Tecnologías'),
                  content: Text('Content for Step 2'),
                ),
                const Step(
                  title: Text('Competencias y habilidades'),
                  content: Text('Content for Step 2'),
                ),
              ]);
        },
      ),
    );
  }
}

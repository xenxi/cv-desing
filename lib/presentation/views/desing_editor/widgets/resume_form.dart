import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/form_step_builder.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              width: 200,
              child: Column(
                children: [
                  const Logo(height: 120),
                  const SizedBox(
                    height: 22,
                  ),
                  ...Section.values.map(
                    (e) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                              child: Text('$e'),
                            )
                          ],
                        ),
                        if (Section.values.indexOf(e) <
                            Section.values.length - 1)
                          Container(
                            margin: const EdgeInsets.only(left: 4.5),
                            height: 30,
                            child: const VerticalDivider(
                              thickness: 3,
                              color: Colors.black,
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
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

  void _updateSelectedSection(BuildContext context, int index) =>
      BlocProvider.of<CvEditorBloc>(context)
          .add(SectionChanged(section: Section.values[index]));

  int _getCurrentStepFrom(CvEditorState state) =>
      Section.values.indexOf(state.section);

  Iterable<Step> _buildStepForms() => Section.values.map(
        (section) => FormStepBuilder.fromSection(section),
      );
}

import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SkillsForm extends StatelessWidget {
  const SkillsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final focusNode = FocusNode();
    return BlocBuilder<CvEditorBloc, CvEditorState>(
      buildWhen: (previous, current) => previous.skills != current.skills,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: TextField(
                focusNode: focusNode,
                controller: controller,
                decoration: InputDecoration(
                    suffix: IconButton(
                        onPressed: () {
                          FocusScope.of(context).requestFocus(focusNode);
                          BlocProvider.of<CvEditorBloc>(context)
                              .add(SkillAdded(skill: controller.text));

                          controller.text = '';
                        },
                        icon: const Icon(Icons.save)),
                    prefixIcon: const Icon(Icons.featured_play_list_outlined),
                    labelText: 'Competencia o habilidad',
                    helperText: 'Pulse enter para agregar'),
                onSubmitted: (skill) {
                  controller.text = '';
                  FocusScope.of(context).requestFocus(focusNode);
                  BlocProvider.of<CvEditorBloc>(context)
                      .add(SkillAdded(skill: skill));
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Wrap(
                children: [
                  ...state.skills.value.map(
                    (skill) => FlipInX(
                      child: InputChip(
                        label: Text(skill),
                        onDeleted: () => BlocProvider.of<CvEditorBloc>(context)
                            .add(SkillDeleted(skill: skill)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

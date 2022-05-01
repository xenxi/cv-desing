import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SkillsForm extends StatelessWidget {
  SkillsForm({Key? key}) : super(key: key);
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () => _saveSkill(context),
                    icon: const Icon(Icons.save),
                  ),
                  prefixIcon: const Icon(Icons.featured_play_list_outlined),
                  labelText: 'Competencia o habilidad',
                  helperText: 'Pulse enter para agregar',
                ),
                onSubmitted: (_) => _saveSkill(context),
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

  void _saveSkill(
    BuildContext context,
  ) {
    FocusScope.of(context).requestFocus(focusNode);
    BlocProvider.of<CvEditorBloc>(context)
        .add(SkillAdded(skill: controller.text));

    controller.clear();
  }
}

import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/price_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SkillsForm extends StatelessWidget {
  const SkillsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final focusNode = FocusNode();
    return BlocBuilder<CveditorBloc, CveditorState>(
      buildWhen: (previous, current) => previous.skills != current.skills,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: TextField(
                focusNode: focusNode,
                controller: controller,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.language_outlined),
                  labelText: 'Competencia o habilidad',
                ),
                onSubmitted: (skill) {
                  controller.text = '';
                  FocusScope.of(context).requestFocus(focusNode);
                  BlocProvider.of<CveditorBloc>(context)
                      .add(SkillAdded(skill: skill));
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Wrap(
                children: [
                  ...state.skills.map((skill) => InputChip(label: Text(skill)))
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

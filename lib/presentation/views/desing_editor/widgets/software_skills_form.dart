import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SoftwareSkillsForm extends StatelessWidget {
  const SoftwareSkillsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CvEditorBloc, CvEditorState>(
      builder: (context, state) {
        return Column(
          children: [
            const _Editor(),
            ...state.resume.softwareSkills.value.map(
              (skill) => ListTile(
                title: Text(skill.getOrCrash()),
                subtitle: LinearProgressIndicator(
                  value: skill.percentage.getOrCrash() / 100,
                ),
                leading: const Icon(Icons.featured_play_list_outlined),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => BlocProvider.of<CvEditorBloc>(context)
                      .add(SoftwareSkillDeleted(name: skill.getOrCrash())),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Editor extends HookWidget {
  const _Editor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final text = useState<String>('');
    final percentage = useState<double>(0);
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.featured_play_list_outlined),
              labelText: 'Software o tecnología',
              helperText: 'Pulse enter para agregar',
            ),
            onChanged: (value) => text.value = value,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Slider(
            onChanged: text.value.isNotEmpty
                ? (double value) => percentage.value = value
                : null,
            value: percentage.value,
            max: 100,
          ),
        ),
        IconButton(
          onPressed: text.value.isNotEmpty
              ? () {
                  BlocProvider.of<CvEditorBloc>(context).add(
                    SoftwareSkillAdded(
                      name: text.value,
                      percentage: percentage.value,
                    ),
                  );

                  controller.clear();
                  percentage.value = 0;
                }
              : null,
          icon: const Icon(Icons.save),
        ),
      ],
    );
  }
}

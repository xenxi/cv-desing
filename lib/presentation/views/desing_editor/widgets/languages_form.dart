import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LanguagesForm extends StatelessWidget {
  const LanguagesForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CvEditorBloc, CvEditorState>(
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              const _Editor(),
              ...state.languages.value.map(
                (language) => ListTile(
                  title: Text(language.value),
                  subtitle: Chip(label: Text(language.level)),
                  leading: const Icon(Icons.language_outlined),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => BlocProvider.of<CvEditorBloc>(context)
                        .add(LanguageDeleted(language.value)),
                  ),
                ),
              ),
            ],
          ),
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
    final level = useState<String>('Básico');

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.language_outlined),
              labelText: 'Idioma',
            ),
            onChanged: (value) => text.value = value,
          ),
        ),
        Expanded(
          child: DropdownButton<String>(
            value: level.value,
            hint: const Text('Nivel'),
            items: const ['Nativo', 'Intermedio', 'Básico'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: controller.text.isNotEmpty
                ? (String? value) => level.value = value ?? 'Básico'
                : null,
          ),
        ),
        IconButton(
          onPressed: text.value.isNotEmpty
              ? () {
                  BlocProvider.of<CvEditorBloc>(context).add(
                    LanguageAdded(
                      text.value,
                      level: level.value,
                    ),
                  );

                  controller.clear();
                  level.value = 'Básico';
                }
              : null,
          icon: const Icon(Icons.save),
        ),
      ],
    );
  }
}

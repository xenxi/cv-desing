import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/languages.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/language_level_extensions.dart';
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
              ...state.resume.languages.value.map(
                (language) => ListTile(
                  title: Text(language.getOrCrash()),
                  subtitle: Chip(label: Text(language.level.displayName)),
                  leading: const Icon(Icons.language_outlined),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => BlocProvider.of<CvEditorBloc>(context)
                        .add(LanguageDeleted(language.getOrCrash())),
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
    final level = useState<LanguageLevel>(LanguageLevel.beginner);

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
          child: Padding(
            padding: const EdgeInsets.only(top: 19, left: 8),
            child: DropdownButton<LanguageLevel>(
              isExpanded: true,
              value: level.value,
              hint: const Text('Nivel'),
              items: LanguageLevel.values.map((LanguageLevel value) {
                return DropdownMenuItem<LanguageLevel>(
                  value: value,
                  child: Text(value.displayName),
                );
              }).toList(),
              onChanged: controller.text.isNotEmpty
                  ? (LanguageLevel? value) =>
                      level.value = value ?? LanguageLevel.beginner
                  : null,
            ),
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
                  level.value = LanguageLevel.beginner;
                }
              : null,
          icon: const Icon(Icons.save),
        ),
      ],
    );
  }
}

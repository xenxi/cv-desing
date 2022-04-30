import 'package:flutter/material.dart';

class LanguagesForm extends StatelessWidget {
  const LanguagesForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.language_outlined),
                    labelText: 'Idioma',
                  ),
                ),
              ),
              Expanded(
                child: DropdownButton<String>(
                  hint: const Text('Nivel'),
                  items: const ['Nativo', 'Intermedio', 'Básico']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

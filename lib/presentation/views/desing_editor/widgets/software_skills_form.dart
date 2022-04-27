import 'package:flutter/material.dart';

class SoftwareSkillsForm extends StatelessWidget {
  const SoftwareSkillsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Añadir'),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.featured_play_list_outlined),
                    labelText: 'Software o tecnología',
                    helperText: 'Pulse enter para agregar'),
                onSubmitted: (skill) {
                  print(skill);
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Slider(
                onChanged: (double value) {},
                value: 0,
                max: 100,
              ),
            )
          ],
        ),
      ],
    );
  }
}

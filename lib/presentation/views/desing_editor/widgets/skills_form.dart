import 'package:cv_desing_website_flutter/presentation/shared/widgets/price_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SkillsForm extends StatelessWidget {
  const SkillsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.language_outlined),
              labelText: 'Idioma',
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Wrap(
            children: [
              InputChip(label: Text('Ejemplo')),
              InputChip(label: Text('Ejemplo'))
            ],
          ),
        )
      ],
    );
  }
}

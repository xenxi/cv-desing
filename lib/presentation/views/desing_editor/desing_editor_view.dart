import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DesingEditorView extends HookWidget {
  const DesingEditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stepper(steps: [
      Step(
        title: const Text('Información personal y contacto'),
        content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Content for Step 1')),
      ),
      const Step(
        title: Text('Formación académica'),
        content: Text('Content for Step 2'),
      ),
      const Step(
        title: Text('Formaciones complementarias'),
        content: Text('Content for Step 2'),
      ),
      const Step(
        title: Text('Experiencia laboral'),
        content: Text('Content for Step 2'),
      ),
      const Step(
        title: Text('Idiomas'),
        content: Text('Content for Step 2'),
      ),
      const Step(
        title: Text('Software y Tecnologías'),
        content: Text('Content for Step 2'),
      ),
      const Step(
        title: Text('Competencias y habilidades'),
        content: Text('Content for Step 2'),
      ),
    ]);
  }
}

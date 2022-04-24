import 'package:flutter/material.dart';

class WorkExperienceForm extends StatelessWidget {
  const WorkExperienceForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Añadir'),
        ),
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.science_outlined),
            labelText: 'Puesto',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.school_outlined),
            labelText: 'Empleador',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.info_outline),
            labelText: 'Descripción del puesto y tareas realizadas',
          ),
          minLines: 4,
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
        Row(
          children: [
            Expanded(
              child: _datePicker(context, text: 'Desde'),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: _datePicker(context, text: 'Hasta'),
            ),
          ],
        )
      ],
    ));
  }

  Widget _datePicker(BuildContext context, {required String text}) =>
      TextFormField(
        enableInteractiveSelection: false,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.date_range_rounded),
          labelText: text,
        ),
        onTap: () => _selectDate(context),
      );

  Future<DateTime?> _selectDate(BuildContext context) => showDatePicker(
        // locale: const Locale('es', 'ES'),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1850),
        lastDate: DateTime.now(),
      );
}

import 'package:flutter/material.dart';

class AcademicTrainingForm extends StatelessWidget {
  const AcademicTrainingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.science_outlined),
            labelText: 'Titulo',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.school_outlined),
            labelText: 'Escuela, instito o universidad',
          ),
        ),
        TextFormField(
          enableInteractiveSelection: false,
          keyboardType: TextInputType.datetime,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.insert_invitation_outlined),
            labelText: 'Desde',
          ),
          onTap: () => _selectDate(context),
        ),
        TextFormField(
          enableInteractiveSelection: false,
          keyboardType: TextInputType.datetime,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.date_range_rounded),
            labelText: 'Hasta',
          ),
          onTap: () => _selectDate(context),
        ),
      ],
    ));
  }

  Future<DateTime?> _selectDate(BuildContext context) => showDatePicker(
        // locale: const Locale('es', 'ES'),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1850),
        lastDate: DateTime.now(),
      );
}

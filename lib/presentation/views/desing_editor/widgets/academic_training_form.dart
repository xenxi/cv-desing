import 'package:cv_desing_website_flutter/application/editor/academy_training_form/academy_training_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcademicTrainingForm extends StatelessWidget {
  const AcademicTrainingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AcademyTrainingFormBloc, AcademyTrainingFormState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
                labelText: 'Titulo',
              ),
              autocorrect: false,
              onChanged: (val) =>
                  BlocProvider.of<AcademyTrainingFormBloc>(context).add(
                TitleChanged(val),
              ),
              validator: (_) => state.academyTraining.title
                  .fold((l) => 'Titulo invalido', (r) => null),
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.school_outlined),
                labelText: 'Escuela, instito o universidad',
              ),
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
      },
    );
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

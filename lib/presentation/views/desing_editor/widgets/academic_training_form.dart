import 'package:cv_desing_website_flutter/presentation/shared/widgets/custom_date_range_picker.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cv_desing_website_flutter/application/editor/academy_training_form/academy_training_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';

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
            CustomFormField(
              text: 'Titulo',
              icon: Icons.science_outlined,
              value: state.academyTraining.title,
              onChanged: (val) =>
                  BlocProvider.of<AcademyTrainingFormBloc>(context).add(
                TitleChanged(val),
              ),
            ),
            CustomFormField(
              text: 'Escuela, instito o universidad',
              icon: Icons.school_outlined,
              value: state.academyTraining.schoold,
              onChanged: (val) =>
                  BlocProvider.of<AcademyTrainingFormBloc>(context).add(
                SchooldChanged(val),
              ),
            ),
            CustomDateRangePicker(
              dateRange: state.academyTraining.dateRange,
            ),
          ],
        ));
      },
    );
  }
}

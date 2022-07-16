import 'package:cv_desing_website_flutter/application/editor/academy_training_form/academy_training_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = _createController(context);
    return BlocListener<AcademyTrainingFormBloc, AcademyTrainingFormState>(
      listenWhen: (previous, current) => current.isLoaded,
      listener: (context, state) {
        controller.text = _getValue(state);
      },
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          icon: Icon(Icons.science_outlined),
          labelText: 'Titulo',
        ),
        onChanged: (val) =>
            BlocProvider.of<AcademyTrainingFormBloc>(context).add(
          TitleChanged(val),
        ),
        validator: (_) => BlocProvider.of<AcademyTrainingFormBloc>(context)
            .state
            .academyTraining
            .title
            .fold((l) => '$l', (r) => null),
      ),
    );
  }

  TextEditingController _createController(BuildContext context) {
    final controller = TextEditingController(
      text: _getValue(
        BlocProvider.of<AcademyTrainingFormBloc>(context).state,
      ),
    );
    return controller;
  }

  String _getValue(AcademyTrainingFormState state) =>
      state.academyTraining.title.fold((l) => l.failedValue ?? '', (r) => r);
}

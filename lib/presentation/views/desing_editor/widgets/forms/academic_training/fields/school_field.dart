import 'package:cv_desing_website_flutter/application/editor/academy_training_form/academy_training_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchooldField extends StatelessWidget {
  const SchooldField({
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
          icon: Icon(Icons.school_outlined),
          labelText: 'Escuela, instito o universidad',
        ),
        onChanged: (val) =>
            BlocProvider.of<AcademyTrainingFormBloc>(context).add(
          SchooldChanged(val),
        ),
        validator: (_) => BlocProvider.of<AcademyTrainingFormBloc>(context)
            .state
            .academyTraining
            .schoold
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
      state.academyTraining.schoold.fold((l) => l.failedValue ?? '', (r) => r);
}

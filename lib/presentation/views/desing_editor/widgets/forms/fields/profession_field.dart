import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfessionField extends StatelessWidget {
  const ProfessionField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = _createController(context);
    return BlocListener<PersonalInformationFormBloc,
        PersonalInformationFormState>(
      listenWhen: (previous, current) => current.isLoaded,
      listener: (context, state) {
        controller.text = _getValue(state);
      },
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          icon: Icon(Icons.work_outline),
          labelText: 'Tu profesión o actividad',
        ),
        onChanged: (val) =>
            BlocProvider.of<PersonalInformationFormBloc>(context)
                .add(ProfessionChanged(val)),
        validator: (_) => BlocProvider.of<PersonalInformationFormBloc>(context)
            .state
            .personalInformation
            .job
            .fold((l) => '$l', (_) => null),
      ),
    );
  }

  TextEditingController _createController(BuildContext context) {
    final controller = TextEditingController(
      text: _getValue(
        BlocProvider.of<PersonalInformationFormBloc>(context).state,
      ),
    );
    return controller;
  }

  String _getValue(PersonalInformationFormState state) =>
      state.personalInformation.job.fold((l) => l.failedValue ?? '', (r) => r);
}

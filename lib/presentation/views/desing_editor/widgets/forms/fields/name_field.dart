import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameField extends StatelessWidget {
  const NameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocListener<PersonalInformationFormBloc,
        PersonalInformationFormState>(
      listenWhen: (previous, current) => current.isLoaded,
      listener: (context, state) {
        controller.text = state.personalInformation.name
            .fold((l) => l.failedValue ?? '', (r) => r);
      },
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          icon: Icon(Icons.person_outline_outlined),
          labelText: 'Tu nombre',
        ),
        onChanged: (val) =>
            BlocProvider.of<PersonalInformationFormBloc>(context).add(
          NameChanged(val),
        ),
        validator: (_) => BlocProvider.of<PersonalInformationFormBloc>(context)
            .state
            .personalInformation
            .name
            .fold((l) => '$l', (_) => null),
      ),
    );
  }
}

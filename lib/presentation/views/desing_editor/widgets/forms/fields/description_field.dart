import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocListener<PersonalInformationFormBloc,
        PersonalInformationFormState>(
      listenWhen: (previous, current) => current.isLoaded,
      listener: (context, state) {
        controller.text = state.personalInformation.description
            .fold((l) => l.failedValue ?? '', (r) => r);
      },
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          icon: Icon(Icons.info_outline),
          labelText: 'Algo sobre ti',
        ),
        onChanged: (val) =>
            BlocProvider.of<PersonalInformationFormBloc>(context)
                .add(PersonalDescriptionChanged(val)),
        validator: (_) => BlocProvider.of<PersonalInformationFormBloc>(context)
            .state
            .personalInformation
            .job
            .fold((l) => '$l', (_) => null),
      ),
    );
  }
}

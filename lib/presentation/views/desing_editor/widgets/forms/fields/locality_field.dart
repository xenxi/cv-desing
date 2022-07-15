import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalityField extends StatelessWidget {
  const LocalityField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocListener<PersonalInformationFormBloc,
        PersonalInformationFormState>(
      listenWhen: (previous, current) => current.isLoaded,
      listener: (context, state) {
        controller.text = state.personalInformation.locality
            .fold((l) => l.failedValue ?? '', (r) => r);
      },
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          icon: Icon(Icons.location_city_outlined),
          labelText: 'Tu localidad',
        ),
        onChanged: (val) =>
            BlocProvider.of<PersonalInformationFormBloc>(context).add(
          LocalityChanged(val),
        ),
        validator: (_) => BlocProvider.of<PersonalInformationFormBloc>(context)
            .state
            .personalInformation
            .locality
            .fold((l) => '$l', (_) => null),
      ),
    );
  }
}

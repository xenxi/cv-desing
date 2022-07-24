import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/name.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/value_object_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameField extends StatelessWidget {
  const NameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = _getName(context);
    final controller = ValueObjectTextField.controllerFrom(name);
    return BlocListener<PersonalInformationFormBloc,
        PersonalInformationFormState>(
      listenWhen: (previous, current) =>
          current.isLoaded || controller.text.isEmpty,
      listener: (context, state) {
        controller.text =
            ValueObjectTextField.valueFrom(state.personalInformation.name);
      },
      child: ValueObjectTextField(
        controller: controller,
        onLoseFocus: () =>
            BlocProvider.of<PersonalInformationFormBloc>(context).add(Saved()),
        icon: Icons.person_outline_outlined,
        label: 'Tu nombre',
        onChanged: (val) =>
            BlocProvider.of<PersonalInformationFormBloc>(context).add(
          NameChanged(val),
        ),
        validator: (_) => _getName(context).fold((l) => '$l', (_) => null),
      ),
    );
  }

  Name _getName(BuildContext context) {
    final bloc = BlocProvider.of<PersonalInformationFormBloc>(context);
    return bloc.state.personalInformation.name;
  }
}

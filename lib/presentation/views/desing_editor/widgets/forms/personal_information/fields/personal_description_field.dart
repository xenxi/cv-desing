import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/description.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/value_object_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalDescriptionField extends StatelessWidget {
  const PersonalDescriptionField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final description = _getDescription(context);
    final controller = ValueObjectTextField.controllerFrom(description);
    return BlocListener<PersonalInformationFormBloc,
        PersonalInformationFormState>(
      listenWhen: (previous, current) => current.isLoaded,
      listener: (context, state) {
        controller.text = ValueObjectTextField.valueFrom(
            state.personalInformation.description);
      },
      child: ValueObjectTextField(
        controller: controller,
        onLoseFocus: () =>
            BlocProvider.of<PersonalInformationFormBloc>(context).add(Saved()),
        icon: Icons.info_outline,
        label: 'Algo sobre ti',
        onChanged: (val) =>
            BlocProvider.of<PersonalInformationFormBloc>(context)
                .add(PersonalDescriptionChanged(val)),
        validator: (_) =>
            _getDescription(context).fold((l) => '$l', (_) => null),
      ),
    );
  }

  Description _getDescription(BuildContext context) {
    final bloc = BlocProvider.of<PersonalInformationFormBloc>(context);
    return bloc.state.personalInformation.description;
  }
}

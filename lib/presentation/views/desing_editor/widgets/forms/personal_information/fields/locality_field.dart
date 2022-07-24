import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/locality.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/value_object_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalityField extends StatelessWidget {
  const LocalityField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locality = _getLocality(context);
    final controller = ValueObjectTextField.controllerFrom(locality);
    return BlocListener<PersonalInformationFormBloc,
        PersonalInformationFormState>(
      listenWhen: (previous, current) => current.isLoaded,
      listener: (context, state) {
        controller.text =
            ValueObjectTextField.valueFrom(state.personalInformation.locality);
      },
      child: ValueObjectTextField(
        onLoseFocus: () =>
            BlocProvider.of<PersonalInformationFormBloc>(context).add(Saved()),
        controller: controller,
        icon: Icons.location_city_outlined,
        label: 'Tu localidad',
        onChanged: (val) =>
            BlocProvider.of<PersonalInformationFormBloc>(context).add(
          LocalityChanged(val),
        ),
        validator: (_) => _getLocality(context).fold((l) => '$l', (_) => null),
      ),
    );
  }

  Locality _getLocality(BuildContext context) {
    final bloc = BlocProvider.of<PersonalInformationFormBloc>(context);
    return bloc.state.personalInformation.locality;
  }
}

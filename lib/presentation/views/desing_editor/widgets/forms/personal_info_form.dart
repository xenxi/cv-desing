import 'dart:typed_data';

import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/custom_form_field.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonalInformationFormBloc,
        PersonalInformationFormState>(
      listenWhen: (previous, current) =>
          previous.saveFailureOrSuccessOption !=
          current.saveFailureOrSuccessOption,
      listener: (context, state) {
        state.saveFailureOrSuccessOption.fold(
          () => {},
          (a) => a.fold(
            (l) => {},
            (_) => BlocProvider.of<CvEditorBloc>(context).add(
              PersonalInformationUpdated(
                personalInformation: state.personalInformation,
              ),
            ),
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            children: [
              GestureDetector(
                onTap: () =>
                    BlocProvider.of<PersonalInformationFormBloc>(context)
                        .add(AvatarChanged()),
                child: _buildAvatar(state.personalInformation.avatarOption),
              ),
              const _NameField(),
              CustomFormField(
                icon: Icons.location_on_outlined,
                text: 'Tu localidad',
                onChanged: (val) =>
                    BlocProvider.of<PersonalInformationFormBloc>(context)
                        .add(LocalityChanged(val)),
                value: state.personalInformation.locality,
                initialized: state.isLoaded,
              ),
              CustomFormField(
                icon: Icons.work_outline,
                text: 'Tu profesión o actividad',
                onChanged: (val) =>
                    BlocProvider.of<PersonalInformationFormBloc>(context)
                        .add(ProfessionChanged(val)),
                value: state.personalInformation.job,
                initialized: state.isLoaded,
              ),
              CustomFormField(
                icon: Icons.info_outline,
                inputType: TextInputType.multiline,
                text: 'Algo sobre ti',
                onChanged: (val) =>
                    BlocProvider.of<PersonalInformationFormBloc>(context)
                        .add(PersonalDescriptionChanged(val)),
                value: state.personalInformation.description,
                initialized: state.isLoaded,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => BlocProvider.of<PersonalInformationFormBloc>(
                  context,
                ).add(Saved()),
                icon: const Icon(Icons.save_alt_outlined),
                label: const Text('Guardar'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAvatar(Option<Uint8List> avatarOption) => CircleAvatar(
        backgroundColor: CustomTheme.primaryColor,
        backgroundImage: avatarOption.fold(
          () => null,
          (a) => MemoryImage(a),
        ),
        radius: 50,
        child: avatarOption.fold(
          () => const Icon(
            Icons.add_a_photo_outlined,
            color: Colors.white,
            size: 60,
          ),
          (a) => null,
        ),
      );
}

class _NameField extends StatelessWidget {
  const _NameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocListener<PersonalInformationFormBloc,
        PersonalInformationFormState>(
      listenWhen: (previous, current) => previous.isLoaded != current.isLoaded,
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

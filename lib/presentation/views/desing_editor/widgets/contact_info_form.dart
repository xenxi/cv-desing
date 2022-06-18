import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactInfoForm extends StatelessWidget {
  const ContactInfoForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactInformationFormBloc,
        ContactInformationFormState>(
      listenWhen: (previous, current) =>
          previous.saveFailureOrSuccessOption !=
          current.saveFailureOrSuccessOption,
      listener: (context, state) {
        state.saveFailureOrSuccessOption.fold(
          () => {},
          (s) => s.fold(
            (l) => {},
            (_) => BlocProvider.of<CvEditorBloc>(context).add(
              ContactInformationUpdated(
                contactInformation: state.contactInformation,
              ),
            ),
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            children: [
              CustomFormField(
                initialized: state.isLoaded,
                text: 'Tu email',
                value: state.contactInformation.emailAddress,
                onChanged: (val) =>
                    BlocProvider.of<ContactInformationFormBloc>(context)
                        .add(EmailChanged(val)),
                icon: Icons.email_outlined,
              ),
              CustomFormField(
                initialized: state.isLoaded,
                text: 'Tu teléfono',
                value: state.contactInformation.phoneNumber,
                onChanged: (val) =>
                    BlocProvider.of<ContactInformationFormBloc>(context)
                        .add(PhoneNumberChanged(val)),
                icon: Icons.phone_outlined,
              ),
              CustomFormField(
                initialized: state.isLoaded,
                text: 'Tu Facebook',
                value: state.contactInformation.socialMedias.facebookOption
                    .fold(() => null, (a) => a),
                onChanged: (val) =>
                    BlocProvider.of<ContactInformationFormBloc>(context)
                        .add(FacebookUrlChanged(val)),
                icon: Icons.facebook_outlined,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => BlocProvider.of<ContactInformationFormBloc>(
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
}

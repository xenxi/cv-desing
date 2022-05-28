import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactInfoForm extends StatelessWidget {
  const ContactInfoForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactInformationFormBloc(),
      child:
          BlocConsumer<ContactInformationFormBloc, ContactInformationFormState>(
        listenWhen: (previous, current) =>
            previous.saveFailureOrSuccessOption !=
            current.saveFailureOrSuccessOption,
        listener: (context, state) {
          state.saveFailureOrSuccessOption.fold(
            () => {},
            (_) => BlocProvider.of<CvEditorBloc>(context).add(
              ContactInformationUpdated(
                contactInformation: state.contactInformation,
              ),
            ),
          );
        },
        builder: (context, state) {
          return Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Tu email',
                  ),
                  onChanged: (val) =>
                      BlocProvider.of<ContactInformationFormBloc>(context)
                          .add(EmailChanged(val)),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone_outlined),
                    labelText: 'Tu teléfono',
                  ),
                  onChanged: (val) =>
                      BlocProvider.of<ContactInformationFormBloc>(context)
                          .add(PhoneNumberChanged(val)),
                ),
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
      ),
    );
  }
}

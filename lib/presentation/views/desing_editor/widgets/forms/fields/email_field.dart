import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocListener<ContactInformationFormBloc,
        ContactInformationFormState>(
      listenWhen: (previous, current) => current.isLoaded,
      listener: (context, state) {
        controller.text = state.contactInformation.emailAddress
            .fold((l) => l.failedValue ?? '', (r) => r);
      },
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          icon: Icon(Icons.email_outlined),
          labelText: 'Tu email',
        ),
        onChanged: (val) =>
            BlocProvider.of<ContactInformationFormBloc>(context).add(
          EmailChanged(val),
        ),
        validator: (_) => BlocProvider.of<ContactInformationFormBloc>(context)
            .state
            .contactInformation
            .emailAddress
            .fold((l) => '$l', (_) => null),
      ),
    );
  }
}

import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactInfoForm extends StatelessWidget {
  const ContactInfoForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Tu email',
            ),
            onChanged: (val) =>
                BlocProvider.of<CvEditorBloc>(context).add(EmailChanged(val)),
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone_outlined),
              labelText: 'Tu teléfono',
            ),
            onChanged: (val) => BlocProvider.of<CvEditorBloc>(context)
                .add(PhoneNumberChanged(val)),
          ),
        ],
      ),
    );
  }
}

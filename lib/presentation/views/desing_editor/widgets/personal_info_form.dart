import 'package:flutter/material.dart';

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        const CircleAvatar(
          radius: 50,
          child: Icon(Icons.account_box_outlined, size: 60),
        ),
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person_outlined),
            labelText: 'Tu nombre',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email_outlined),
            labelText: 'Tu email',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.phone_outlined),
            labelText: 'Tu teléfono',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.location_on_outlined),
            labelText: 'Tu localidad',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.work_outline),
            labelText: 'Tu profesión o actividad',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.info_outline),
            labelText: 'Algo sobre ti',
          ),
          minLines: 4,
          keyboardType: TextInputType.multiline,
          maxLines: null,
        )
      ]),
    );
  }
}

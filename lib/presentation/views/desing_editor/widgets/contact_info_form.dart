import 'package:flutter/material.dart';

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
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone_outlined),
              labelText: 'Tu teléfono',
            ),
          ),
        ],
      ),
    );
  }
}

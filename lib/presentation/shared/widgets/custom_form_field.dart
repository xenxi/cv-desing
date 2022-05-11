import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.onChanged,
    required this.value,
    required this.text,
    required this.icon,
    required this.initialized,
  }) : super(key: key);
  final void Function(String val) onChanged;
  final ValueObject value;
  final String text;
  final IconData icon;
  final bool initialized;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: !initialized
          ? null
          : value.fold(
              (l) => null,
              (r) => TextEditingController(text: '$r')
                ..selection = TextSelection.fromPosition(
                    TextPosition(offset: '$r'.length))),
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: text,
      ),
      autocorrect: false,
      onChanged: onChanged,
      validator: (_) => value.fold((l) => 'Titulo invalido', (r) => null),
    );
  }
}

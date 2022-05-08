import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.onChanged,
    required this.value,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final void Function(String val) onChanged;
  final ValueObject value;
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) => TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: text,
        ),
        autocorrect: false,
        onChanged: onChanged,
        validator: (_) => value.fold((l) => 'Titulo invalido', (r) => null),
      );
}

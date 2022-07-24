import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:flutter/material.dart';

class ValueObjectTextField extends StatelessWidget {
  const ValueObjectTextField({
    Key? key,
    required this.controller,
    required this.onLoseFocus,
    required this.icon,
    required this.label,
    required this.onChanged,
    this.validator,
  }) : super(key: key);
  final TextEditingController controller;
  final void Function() onLoseFocus;
  final IconData icon;
  final String label;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();

    return TextFormField(
      controller: controller,
      focusNode: focusNode
        ..addListener(() {
          if (!focusNode.hasFocus) {
            onLoseFocus();
          }
        }),
      decoration: InputDecoration(
        icon: Icon(icon),
        labelText: label,
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }

  static TextEditingController controllerFrom(
    ValueObject<String> valueObject,
  ) =>
      TextEditingController(
        text: valueFrom(valueObject),
      );

  static String valueFrom(ValueObject<String> valueObject) =>
      valueObject.fold((l) => l.failedValue ?? '', (r) => r);
}

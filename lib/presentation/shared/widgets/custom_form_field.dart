import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({
    Key? key,
    this.inputType,
    required this.onChanged,
    required ValueObject? value,
    required this.text,
    required this.icon,
    required this.initialized,
  })  : valueOption = optionOf(value),
        super(key: key);
  final TextInputType? inputType;
  final void Function(String val) onChanged;
  final Option<ValueObject> valueOption;
  final String text;
  final IconData icon;
  final bool initialized;
  @override
  Widget build(BuildContext context) => TextFormField(
        controller: !initialized
            ? null
            : valueOption.fold(
                () => null,
                (v) {
                  final textvalue =
                      v.fold((l) => '${l.failedValue ?? ''}', (r) => '$r');
                  return TextEditingController(text: textvalue)
                    ..selection = TextSelection.fromPosition(
                      TextPosition(offset: textvalue.length),
                    );
                },
              ),
        keyboardType: inputType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: text,
        ),
        inputFormatters: inputType != null && inputType == TextInputType.number
            ? [
                FilteringTextInputFormatter.digitsOnly,
              ]
            : null,
        minLines: inputType == TextInputType.multiline ? 4 : null,
        maxLines: null,
        autocorrect: false,
        onChanged: onChanged,
        validator: (_) => valueOption
            .map((a) => a.fold((l) => '$l', (r) => null))
            .getOrElse(() => null),
      );
}

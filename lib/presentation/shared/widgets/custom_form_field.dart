import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomFormField extends HookWidget {
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
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final selection = useState(
      TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      ),
    );
    useEffect(
      () {
        valueOption.fold(
          () {},
          (value) {
            final textvalue = _toString(value);

            controller.text = textvalue;
            final initialCharacter =
                selection.value.start > controller.text.length
                    ? controller.text.length
                    : selection.value.start;
            controller.selection = TextSelection.fromPosition(
              TextPosition(offset: initialCharacter),
            );
          },
        );
        return null;
      },
      [valueOption],
    );

    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: text,
      ),
      inputFormatters: inputTypeNumber
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : null,
      minLines: inputType == TextInputType.multiline ? 4 : null,
      maxLines: null,
      autocorrect: false,
      onChanged: (v) {
        selection.value = controller.selection;
        onChanged(v);
        // controller.selection.
      },
      validator: (_) => valueOption
          .map((a) => a.fold((l) => '$l', (r) => null))
          .getOrElse(() => null),
    );
  }

  String _toString(ValueObject<dynamic> value) => value.fold(
        (l) => '${l.failedValue ?? (inputTypeNumber ? '0' : '')}',
        (r) => '$r',
      );

  bool get inputTypeNumber =>
      inputType != null && inputType == TextInputType.number;
}

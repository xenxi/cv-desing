import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:flutter/material.dart';

class TextBanner extends StatelessWidget {
  const TextBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Impulsa el potencial de CV y destácate',
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.5,
          ),
        ),
        const SizedBox(
          height: CustomTheme.defaultPadding,
        ),
        _checkListText(context, text: 'Elimina la molestia de escribir un CV'),
        _checkListText(context, text: 'Gran cantidad de diseños'),
        _checkListText(context, text: 'Obten tu CV en poco tiempo'),
      ],
    );
  }

  Widget _checkListText(BuildContext context, {required String text}) => Row(
        children: [
          const Icon(
            Icons.check,
            color: CustomTheme.primaryColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white))
        ],
      );
}

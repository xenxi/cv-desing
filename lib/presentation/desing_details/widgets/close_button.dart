import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';

class RoundedCloseButton extends StatelessWidget {
  const RoundedCloseButton({
    Key? key,
    this.padding,
  }) : super(key: key);
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    final btn = _buildButton();

    return padding != null
        ? Padding(
            padding: padding!,
            child: btn,
          )
        : btn;
  }

  Widget _buildButton() => ClipOval(
        child: Material(
          color: CustomTheme.primaryColor,
          child: const CloseButton(),
        ),
      );
}

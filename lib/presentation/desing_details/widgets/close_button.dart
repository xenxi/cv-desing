import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';

class RoundedCloseButton extends StatelessWidget {
  const RoundedCloseButton({
    Key? key,
    this.padding,
  }) : super(key: key);
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    final btn = _buildButton(context);

    return padding != null
        ? Padding(
            padding: padding!,
            child: btn,
          )
        : btn;
  }

  Widget _buildButton(BuildContext context) => Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0, 0.0), //(x,y)
              blurRadius: 9.0,
            ),
          ],
        ),
        child: ClipOval(
          child: Material(
            borderRadius: BorderRadius.circular(20),
            color: CustomTheme.primaryColor,
            child: IconButton(
              tooltip: Location.close,
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
            ),
          ),
        ),
      );
}

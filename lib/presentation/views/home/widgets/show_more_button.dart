import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowMoreButton extends StatelessWidget {
  const ShowMoreButton({
    Key? key,
    this.color = CustomTheme.primaryColor,
    required this.onPressed,
  }) : super(key: key);
  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(primary: color),
      onPressed: onPressed,
      child: Row(
        children: const [
          Text(
            'Ver todos',
          ),
          SizedBox(width: 5),
          FaIcon(FontAwesomeIcons.angleRight),
        ],
      ),
    );
  }
}

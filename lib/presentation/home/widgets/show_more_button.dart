import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowMoreButton extends StatelessWidget {
  const ShowMoreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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

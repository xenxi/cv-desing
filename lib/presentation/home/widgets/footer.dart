import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildFooterText(context);
  }

  Widget _buildFooterText(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? footerTextStyle = textTheme.caption?.copyWith(
      color: CustomTheme.primaryText2,
      fontWeight: FontWeight.bold,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            '© ${DateTime.now().year} ${Location.rightsReserved} ',
            style: footerTextStyle,
          ),
        ),
        Center(
          child: SelectableText.rich(
            TextSpan(
              text: '${Location.designedBy} ',
              style: footerTextStyle,
              children: [
                TextSpan(
                  text: '${Location.dsCurriculum}.',
                  style: footerTextStyle?.copyWith(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: '${Location.builtBy} ',
                style: footerTextStyle,
                children: [
                  TextSpan(
                    text: '${Location.amdiaz}. ',
                    style: footerTextStyle?.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${Location.madeIn} ', style: footerTextStyle),
            const SizedBox(
              height: 4,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                ImagePath.spainFlag,
                width: 16,
                height: 16,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(' ${Location.withLove} ', style: footerTextStyle),
            const SizedBox(
              height: 4,
            ),
            const FaIcon(
              FontAwesomeIcons.solidHeart,
              color: Colors.red,
              size: 12,
            ),
          ],
        ),
      ],
    );
  }
}

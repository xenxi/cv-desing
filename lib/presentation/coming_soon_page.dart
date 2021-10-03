import 'package:cv_desing_website_flutter/presentation/shared/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logoHeight = MediaQuery.of(context).size.width * .4;
    return Scaffold(
      appBar: _buildLogo(logoHeight),
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ..._buildText(context),
            const SizedBox(
              height: 20,
            ),
            _buildSocialLinks(context),
          ],
        ),
      ),
    );
  }

  AppBar _buildLogo(double logoHeight) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: logoHeight,
      title: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
          child: LogoWidget(
            height: logoHeight - 30,
            // color: Colors.amberAccent,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildText(BuildContext context) => [
        Center(
            child: Text(
          'Oops...',
          style: Theme.of(context).textTheme.headline1,
        )),
        Center(
            child: Text(
          'En construcción',
          style: Theme.of(context).textTheme.headline5,
        )),
      ];

  Widget _buildSocialLinks(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSocialLinkButton(context, icon: FontAwesomeIcons.envelope),
          _buildSocialLinkButton(context, icon: FontAwesomeIcons.instagram),
          _buildSocialLinkButton(context, icon: FontAwesomeIcons.tiktok),
        ],
      );

  Widget _buildSocialLinkButton(BuildContext context,
          {required IconData icon}) =>
      IconButton(onPressed: () => {}, icon: FaIcon(icon));
}

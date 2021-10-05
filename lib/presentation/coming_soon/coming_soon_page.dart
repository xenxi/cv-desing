import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/coming_soon/components/comin_soon_logo_widget.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links_widget.dart';
import 'package:flutter/material.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: size.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ComingSoonLogoWidget(),
              ..._buildText(context),
              const SizedBox(
                height: 20,
              ),
              const SocialLinksWidget(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildText(BuildContext context) => [
        Center(
            child: FadeInLeft(
          child: Text(
            'Oops...',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        )),
        Center(
            child: FadeInRight(
          delay: const Duration(milliseconds: 500),
          child: Text(
            'En construcción',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        )),
      ];
}

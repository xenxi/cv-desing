import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/shared/social_links.dart';
import 'package:cv_desing_website_flutter/presentation/views/coming_soon/widgets/comin_soon_logo.dart';
import 'package:flutter/material.dart';

class ComingSoonView extends StatelessWidget {
  const ComingSoonView({Key? key}) : super(key: key);

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
              const ComingSoonLogo(),
              ..._buildText(context),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: SocialLinks(),
              ),
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
          ),
        ),
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
          ),
        ),
      ];
}

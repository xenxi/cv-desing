import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomTheme.secondaryColor,
      padding: const EdgeInsets.all(CustomTheme.defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNotFoundIcon(),
          const SizedBox(
            height: CustomTheme.defaultPadding,
          ),
          _buildTextInfo(context),
          const SizedBox(
            height: CustomTheme.defaultPadding * 2,
          ),
          _buildGoHomeButton(context)
        ],
      ),
    );
  }

  Widget _buildNotFoundIcon() => const Icon(
        Icons.search_off,
        color: CustomTheme.errorColor,
        size: 100,
      );

  Widget _buildTextInfo(BuildContext context) => Text(
        Location.resourceNotFound,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(color: CustomTheme.errorColor),
      );

  OutlinedButton _buildGoHomeButton(BuildContext context) =>
      OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(10.0),
            side: const BorderSide(width: 1.0, color: CustomTheme.errorColor),
          ),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, AppRouter.home),
          icon: const Icon(Icons.refresh, color: CustomTheme.errorColor),
          label: const Text(
            Location.goBack,
            style: TextStyle(color: CustomTheme.errorColor),
          ));
}

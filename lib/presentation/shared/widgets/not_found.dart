import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomTheme.secondaryColor,
      padding: EdgeInsets.all(CustomTheme.defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            color: CustomTheme.errorColor,
            size: 100,
          ),
          SizedBox(
            height: CustomTheme.defaultPadding,
          ),
          _buildTextInfo(context),
          SizedBox(
            height: CustomTheme.defaultPadding * 2,
          ),
          _buildGoHomeButton(context)
        ],
      ),
    );
  }

  Text _buildTextInfo(BuildContext context) => Text(
        'No se ha encontrado el recurso que buscaba',
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
            side: BorderSide(width: 1.0, color: CustomTheme.errorColor),
          ),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, AppRouter.home),
          icon: Icon(Icons.refresh, color: CustomTheme.errorColor),
          label: Text(
            'Ir al menu',
            style: TextStyle(color: CustomTheme.errorColor),
          ));
}

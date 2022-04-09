import 'package:cv_desing_website_flutter/application/navigation/bloc/navigation_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/login_button/login_button.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomMobileNavBar extends StatelessWidget with PreferredSizeWidget {
  const CustomMobileNavBar({
    Key? key,
    this.loginButtonVisible = true,
  }) : super(key: key);
  final bool loginButtonVisible;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: CustomTheme.navbarHeight,
      backgroundColor: CustomTheme.secondaryColor,
      actions: [
        if (loginButtonVisible) ...[
          const LoginButton(
            iconColor: Colors.white,
            isMobile: true,
          ),
          const SizedBox(width: 10),
        ]
      ],
      title: Center(
        child: Logo(
          height: 50,
          onTap: () => BlocProvider.of<NavigationBloc>(context)
              .add(const NavigateToHomeSelected()),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(CustomTheme.navbarMobileHeight);
}

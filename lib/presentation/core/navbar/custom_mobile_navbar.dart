import 'package:cv_desing_website_flutter/presentation/core/routes/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/login_button/login_button.dart';
import 'package:cv_desing_website_flutter/presentation/cv_desing_app.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';
import 'package:flutter/material.dart';

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
          onTap: () => Navigator.of(navigator.currentContext!).pushNamed(
            AppRouter.home,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(CustomTheme.navbarMobileHeight);
}

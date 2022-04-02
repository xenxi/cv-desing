import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/login_button/login_button.dart';
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
      title: Row(
        children: [
          const Spacer(),
          Logo(
            height: 50,
            onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
              AppRouter.home,
              (Route<dynamic> route) => false,
            ),
          ),
          const Spacer(),
          if (loginButtonVisible) ...[
            const SizedBox(
              width: 20,
            ),
            const LoginButton(
              iconColor: Colors.white,
              isMobile: true,
            ),
          ]
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(CustomTheme.navbarMobileHeight);
}

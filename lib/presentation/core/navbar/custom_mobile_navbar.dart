import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';
import 'package:flutter/material.dart';

class CustomMobileNavBar extends StatelessWidget with PreferredSizeWidget {
  const CustomMobileNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: CustomTheme.navbarHeight,
      backgroundColor: CustomTheme.secondaryColor,
      title: IntrinsicHeight(
        child: Row(
          children: [
            const Spacer(),
            Logo(
              height: 50,
              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                AppRouter.home,
                (Route<dynamic> route) => false,
              ),
            ),
            const SizedBox(
              width: 35,
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(CustomTheme.navbarMobileHeight);
}

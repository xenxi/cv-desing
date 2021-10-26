import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';

class CustomMobileNavBar extends StatelessWidget with PreferredSizeWidget {
  const CustomMobileNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: CustomTheme.navbarHeight,
      // backgroundColor: CustomTheme.secondaryColor,
      backgroundColor: const Color(0xFF313131),
      title: IntrinsicHeight(
        child: Row(
          children: [
            const Spacer(),
            Logo(
              height: 80,
              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRouter.home, (Route<dynamic> route) => false),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

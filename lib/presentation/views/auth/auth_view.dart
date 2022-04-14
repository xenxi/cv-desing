import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/views/auth/sections/login/sign_in_mobile_section.dart';
import 'package:cv_desing_website_flutter/presentation/views/auth/sections/login/sign_in_section.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return SingleChildScrollView(
          padding: sizingInformation.isMobile
              ? null
              : const EdgeInsets.all(CustomTheme.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMobileSection(sizingInformation),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileSection(SizingInformation sizingInformation) =>
      sizingInformation.isMobile
          ? const SignInMobileSection()
          : const SignInSection();
}

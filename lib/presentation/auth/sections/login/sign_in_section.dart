import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/auth/sections/login/sign_in_form.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:cv_desing_website_flutter/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/section.dart';

class SignInSection extends StatelessWidget {
  const SignInSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInFormBloc>(),
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.isMobile) {
            return _buildBody(
              isMobile: true,
              child: const Padding(
                padding: EdgeInsets.all(CustomTheme.defaultPadding),
                child: SignInForm(),
              ),
            );
          }

          return _buildBody(
            isMobile: false,
            child: const SizedBox(
              width: 550,
              child: SignInForm(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody({required bool isMobile, required Widget child}) => Section(
        isMobile: isMobile,
        child: FadeInDown(
          child: Container(
            padding: const EdgeInsets.all(CustomTheme.defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(CustomTheme.defaultBorderRadius),
            ),
            child: child,
          ),
        ),
      );
}

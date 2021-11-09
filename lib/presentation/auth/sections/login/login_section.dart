import 'package:cv_desing_website_flutter/presentation/auth/sections/login/signin_form.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:cv_desing_website_flutter/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/section.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({
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
              width: 500,
              child: SignInForm(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody({required bool isMobile, required Widget child}) => Section(
        isMobile: isMobile,
        child: child,
      );
}

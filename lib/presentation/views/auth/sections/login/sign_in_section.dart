import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:cv_desing_website_flutter/presentation/views/auth/sections/login/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInSection extends StatelessWidget {
  const SignInSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInFormBloc>(),
      child: _buildBody(
        child: const SignInForm(),
      ),
    );
  }

  Widget _buildBody({required Widget child}) => FadeInDown(
        child: Container(
          padding: const EdgeInsets.all(CustomTheme.defaultPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(CustomTheme.defaultBorderRadius),
          ),
          child: Column(
            children: [
              const Image(
                image: AssetImage(ImagePath.signInMain),
                fit: BoxFit.contain,
              ),
              child,
            ],
          ),
        ),
      );
}

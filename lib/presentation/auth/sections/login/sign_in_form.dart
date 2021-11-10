import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/auth_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_in_with_google_button.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () => {},
          (either) => either.fold(
            (l) => print(l),
            (r) => _onSignInSuccessfully(context),
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BounceInDown(
                delay: const Duration(milliseconds: 200),
                child: _buildEmailField(context),
              ),
              BounceInDown(
                delay: const Duration(milliseconds: 400),
                child: _buildPasswordField(context),
              ),
              const SizedBox(
                height: CustomTheme.defaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: BounceInLeft(
                      delay: const Duration(milliseconds: 700),
                      child: _buildSignInButton(context),
                    ),
                  ),
                  const SizedBox(
                    width: CustomTheme.defaultPadding,
                  ),
                  Expanded(
                    child: BounceInRight(
                      delay: const Duration(milliseconds: 900),
                      child: _buildSignUpButton(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: CustomTheme.defaultPadding,
              ),
              BounceInUp(
                delay: const Duration(milliseconds: 900),
                child: SignInWithGoogleButton(
                  onPressed: () => BlocProvider.of<SignInFormBloc>(context)
                      .add(const SignInWithGooglePressed()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onSignInSuccessfully(BuildContext context) {
    Navigator.of(context).pop();
    BlocProvider.of<AuthBloc>(context).add(AuthCheckRequested());
  }

  Widget _buildSignUpButton(BuildContext context) => ElevatedButton.icon(
        onPressed: () => BlocProvider.of<SignInFormBloc>(context)
            .add(const SignUpWithEmailAndPasswordPressed()),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: CustomTheme.paddingBigButton,
          ),
        ),
        icon: const Icon(Icons.app_registration_outlined),
        label: const Text(Location.signUp),
      );

  Widget _buildSignInButton(BuildContext context) => ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: CustomTheme.paddingBigButton,
          ),
        ),
        onPressed: () => BlocProvider.of<SignInFormBloc>(context)
            .add(const SignInWithEmailAndPasswordPressed()),
        icon: const Icon(Icons.login_outlined),
        label: const Text(Location.signIn),
      );

  TextFormField _buildPasswordField(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.lock_outline),
        labelText: Location.password,
      ),
      obscureText: true,
      autocorrect: false,
      validator: (_) => BlocProvider.of<SignInFormBloc>(context)
          .state
          .password
          .fold((l) => Location.invalidPassword, (r) => null),
      onChanged: (val) =>
          BlocProvider.of<SignInFormBloc>(context).add(PasswordChanged(val)),
    );
  }

  TextFormField _buildEmailField(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email_outlined),
        labelText: Location.email,
      ),
      autocorrect: false,
      validator: (_) => BlocProvider.of<SignInFormBloc>(context)
          .state
          .email
          .fold((l) => Location.invalidEmail, (r) => null),
      onChanged: (val) =>
          BlocProvider.of<SignInFormBloc>(context).add(EmailChanged(val)),
    );
  }
}

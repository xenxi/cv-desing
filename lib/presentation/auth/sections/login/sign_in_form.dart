import 'package:cv_desing_website_flutter/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () => {},
          (either) =>
              either.fold((l) => null, (r) => Navigator.of(context).pop()),
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
              _buildEmailField(context),
              _buildPasswordField(context),
              const SizedBox(
                height: CustomTheme.defaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: _buildSignInButton(context),
                  ),
                  const SizedBox(
                    width: CustomTheme.defaultPadding,
                  ),
                  Expanded(
                    child: _buildSignUpButton(),
                  ),
                ],
              ),
              const SizedBox(
                height: CustomTheme.defaultPadding,
              ),
              _buildSignInWithGoogleButton(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSignInWithGoogleButton(BuildContext context) =>
      OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 2, color: Colors.grey),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(CustomTheme.defaultBorderRadius)),
          padding: const EdgeInsets.symmetric(
            vertical: CustomTheme.paddingBigButton,
          ),
        ),
        onPressed: () => BlocProvider.of<SignInFormBloc>(context)
            .add(const SignInWithGooglePressed()),
        icon: Image.asset(
          ImagePath.googleIcon,
          height: 35,
          fit: BoxFit.contain,
        ),
        label: const Text(
          Location.signInWithGoogle,
          style: TextStyle(color: CustomTheme.primaryText1),
        ),
      );
  // ElevatedButton.icon(
  //   onPressed: () => BlocProvider.of<SignInFormBloc>(context)
  //       .add(const SignInWithGooglePressed()),
  //   icon: const FaIcon(FontAwesomeIcons.google),
  //   label: const Text(Location.signInWithGoogle),
  // );

  Widget _buildSignUpButton() => ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.app_registration_outlined),
        label: const Text(Location.signUp),
      );

  Widget _buildSignInButton(BuildContext context) => ElevatedButton.icon(
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
          .fold((l) => '$l', (r) => null),
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
          .fold((l) => '$l', (r) => null),
      onChanged: (val) =>
          BlocProvider.of<SignInFormBloc>(context).add(EmailChanged(val)),
    );
  }
}

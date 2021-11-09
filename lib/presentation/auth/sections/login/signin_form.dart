import 'package:cv_desing_website_flutter/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: Location.email,
                ),
                autocorrect: false,
                validator: (_) => BlocProvider.of<SignInFormBloc>(context)
                    .state
                    .email
                    .fold((l) => '$l', (r) => null),
                onChanged: (val) => BlocProvider.of<SignInFormBloc>(context)
                    .add(EmailChanged(val)),
              ),
              TextFormField(
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
                onChanged: (val) => BlocProvider.of<SignInFormBloc>(context)
                    .add(PasswordChanged(val)),
              ),
              const SizedBox(
                height: CustomTheme.defaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => BlocProvider.of<SignInFormBloc>(context)
                          .add(const SignInWithEmailAndPasswordPressed()),
                      icon: const Icon(Icons.login_outlined),
                      label: const Text(Location.signIn),
                    ),
                  ),
                  const SizedBox(
                    width: CustomTheme.defaultPadding,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.app_registration_outlined),
                      label: const Text(Location.signUp),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: CustomTheme.defaultPadding,
              ),
              ElevatedButton.icon(
                onPressed: () => BlocProvider.of<SignInFormBloc>(context)
                    .add(const SignInWithGooglePressed()),
                icon: const FaIcon(FontAwesomeIcons.google),
                label: const Text(Location.signInWithGoogle),
              ),
            ],
          ),
        );
      },
    );
  }
}

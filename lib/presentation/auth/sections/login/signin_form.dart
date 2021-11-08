import 'package:cv_desing_website_flutter/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        // TODO: implement listener
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
            ],
          ),
        );
      },
    );
  }
}

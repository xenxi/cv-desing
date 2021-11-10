import 'package:cv_desing_website_flutter/application/auth_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/auth/sections/login/sign_in_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);
  static const iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return IconButton(
            onPressed: () => BlocProvider.of<AuthBloc>(context).add(SignOut()),
            icon: const Icon(
              Icons.logout_outlined,
              color: iconColor,
            ),
          );
        }

        return IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const SignInDialog();
              },
            );
            // Navigator.of(context).pushNamed(AppRouter.auth);
          },
          icon: const Icon(
            Icons.login,
            color: iconColor,
          ),
        );
      },
    );
  }
}

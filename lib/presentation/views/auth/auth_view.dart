import 'package:cv_desing_website_flutter/presentation/views/auth/sections/login/sign_in_section.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 600,
        ),
        child: const SignInSection(),
      ),
    );
  }
}

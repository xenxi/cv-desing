import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pushNamed(AppRouter.auth),
      icon: const Icon(
        Icons.login,
        color: Colors.black,
      ),
    );
  }
}

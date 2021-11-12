import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return _buildSignInWithGoogleButton(context);
  }

  Widget _buildSignInWithGoogleButton(BuildContext context) =>
      OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 2, color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(CustomTheme.defaultBorderRadius),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: CustomTheme.paddingBigButton,
            horizontal: CustomTheme.paddingBigButton / 2,
          ),
        ),
        onPressed: onPressed,
        icon: Image.asset(
          ImagePath.googleIcon,
          height: 35,
          fit: BoxFit.contain,
        ),
        label: const Text(
          Location.signInWithGoogle,
          style: TextStyle(
            color: CustomTheme.primaryText1,
          ),
          textAlign: TextAlign.center,
        ),
      );
}

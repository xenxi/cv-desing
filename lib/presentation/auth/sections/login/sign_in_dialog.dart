import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/auth/sections/login/sign_in_form.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInDialog extends StatelessWidget {
  const SignInDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CustomTheme.defaultBorderRadius),
      ),
      elevation: 0,
      insetAnimationCurve: Curves.elasticInOut,
      backgroundColor: Colors.transparent,
      child: BlocProvider(
        create: (context) => getIt<SignInFormBloc>(),
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 550,
          ),
          height: 680,
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    const avatarRadius = 200.0;
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        _buildForm(avatarRadius),
        _buildAvatar(avatarRadius),
      ],
    );
  }

  Positioned _buildAvatar(double avatarRadius) => Positioned(
        left: CustomTheme.defaultPadding,
        right: CustomTheme.defaultPadding,
        child: FlipInX(
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: avatarRadius,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(avatarRadius)),
              child: Image.asset(ImagePath.signInMain),
            ),
          ),
        ),
      );

  Container _buildForm(double avatarRadius) => Container(
        padding: EdgeInsets.only(
          left: CustomTheme.defaultPadding,
          top: avatarRadius + CustomTheme.defaultPadding,
          right: CustomTheme.defaultPadding,
          bottom: CustomTheme.defaultPadding,
        ),
        margin: EdgeInsets.only(top: avatarRadius),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(CustomTheme.defaultBorderRadius),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 10), blurRadius: 10),
          ],
        ),
        child: const SignInForm(),
      );
}

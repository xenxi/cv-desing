import 'package:cv_desing_website_flutter/application/auth_bloc.dart';
import 'package:cv_desing_website_flutter/domain/auth/user.dart';
import 'package:cv_desing_website_flutter/presentation/core/routes/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/views/auth/sections/login/sign_in_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_avatar.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    this.iconColor = Colors.black,
    required this.isMobile,
  }) : super(key: key);
  final Color iconColor;
  final bool isMobile;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return _buildAuthMenu(context, user: state.user);
        }

        return IconButton(
          onPressed: () {
            if (isMobile) {
              Navigator.of(context).pushNamed(AppRouter.auth);
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SignInDialog();
                },
              );
            }
          },
          icon: Icon(
            Icons.login,
            color: iconColor,
          ),
        );
      },
    );
  }

  Widget _buildAuthMenu(BuildContext context, {required User user}) {
    return PopupMenuButton<int>(
      iconSize: 50,
      tooltip: Location.showMenu,
      icon: UserAvatar(
        avatarUrl: user.avatarUrl,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          enabled: false,
          child: Center(
            child: UserAvatar(
              avatarUrl: user.avatarUrl,
              radius: 35,
            ),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 2,
          onTap: () => BlocProvider.of<AuthBloc>(context).add(SignOut()),
          child: _buildItem(
            context,
            text: Location.signOut,
            iconData: Icons.logout_outlined,
            onTap: () => BlocProvider.of<AuthBloc>(context).add(SignOut()),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required IconData iconData,
    required String text,
    required void Function() onTap,
  }) =>
      ListTile(
        leading: Icon(iconData),
        title: Text(text),
        onTap: onTap,
      );
}

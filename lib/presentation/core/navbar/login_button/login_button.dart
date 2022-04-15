import 'package:cv_desing_website_flutter/application/auth/auth_bloc.dart';
import 'package:cv_desing_website_flutter/application/navigation/navigation_bloc.dart';
import 'package:cv_desing_website_flutter/domain/auth/user.dart';
import 'package:cv_desing_website_flutter/presentation/core/navbar/login_button/user_avatar.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    this.iconColor = Colors.black,
  }) : super(key: key);
  final Color iconColor;
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
          onPressed: () => BlocProvider.of<NavigationBloc>(context)
              .add(const NavigateToAuthSelected()),
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

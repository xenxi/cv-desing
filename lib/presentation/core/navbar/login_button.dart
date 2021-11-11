import 'package:cv_desing_website_flutter/application/auth_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/auth/sections/login/sign_in_dialog.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
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
          return _buildAuthMenu(context);
        }

        return IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const SignInDialog();
              },
            );
          },
          icon: const Icon(
            Icons.login,
            color: iconColor,
          ),
        );
      },
    );
  }

  Widget _buildAuthMenu(BuildContext context) {
    return PopupMenuButton<int>(
      iconSize: 50,
      tooltip: Location.showMenu,
      icon: CircleAvatar(
        // radius: 80,
        backgroundColor: CustomTheme.secondaryColor,
        child: Icon(Icons.person),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text(
            "Editar",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
          ),
        ),
        PopupMenuDivider(),
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

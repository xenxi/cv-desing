import 'package:cv_desing_website_flutter/application/auth/auth_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/views/auth/auth_view.dart';
import 'package:cv_desing_website_flutter/presentation/views/coming_soon/coming_soon_view.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_details/desing_details_view.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/desing_editor_view.dart';
import 'package:cv_desing_website_flutter/presentation/views/desings/desings_view.dart';
import 'package:cv_desing_website_flutter/presentation/views/home/home_view.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static const String initial = '/';
  static const String blog = '/blog';
  static const String home = '/home';
  static const String desings = '/desings';
  static const String details = '/desings/:reference';
  static const String auth = '/auth';
  static const String editor = '/editor';

  static Map<
      String,
      Widget Function(
    BuildContext? context,
    Map<String, List<String>> params,
  )> routesMap = {
    initial: (context, params) => const HomeView(),
    home: (context, params) => const HomeView(),
    blog: (context, params) => const ComingSoonView(),
    auth: (context, params) => const AuthView(),
    editor: (context, params) {
      return const DesingEditorView();

      if (context != null &&
          BlocProvider.of<AuthBloc>(context).state is Authenticated) {
        return const DesingEditorView();
      } else {
        return const AuthView();
      }
    },
    details: (context, params) {
      final referenceOption = optionOf(params['reference']?.first);
      return referenceOption.fold(
        () => const DesingsView(),
        (reference) => DesingDetailsView(
          reference: reference,
        ),
      );
    },
    desings: (context, params) => const DesingsView(),
  };
}

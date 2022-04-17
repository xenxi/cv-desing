import 'package:cv_desing_website_flutter/presentation/views/auth/auth_view.dart';
import 'package:cv_desing_website_flutter/presentation/views/coming_soon/coming_soon_view.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_details/desing_details_view.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/desing_editor_view.dart';
import 'package:cv_desing_website_flutter/presentation/views/desings/desings_view.dart';
import 'package:cv_desing_website_flutter/presentation/views/home/home_view.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String initial = '/';
  static const String blog = '/blog';
  static const String home = '/home';
  static const String desings = '/desings';
  static const String details = '/desings/:reference';
  static const String auth = '/auth';
  static const String editor = '/editor';
  static Map<String, WidgetBuilder> routes = {
    // '': (context) => const ComingSoonPage(),
    initial: (context) => const HomeView(),
    home: (context) => const HomeView(),
    blog: (context) => const ComingSoonView(),
    auth: (context) => const AuthView(),
    editor: (context) => const DesingEditorView(),
    details: (context) => const DesingDetailsView(reference: ''),
    desings: (context) => const DesingsView(),
  };
  static Map<String, Widget Function(Map<String, List<String>> params)>
      routesMap = {
    initial: (_) => const HomeView(),
    home: (_) => const HomeView(),
    blog: (_) => const ComingSoonView(),
    auth: (_) => const AuthView(),
    editor: (context) => const DesingEditorView(),
    details: (params) {
      final referenceOption = optionOf(params['reference']?.first);
      return referenceOption.fold(
        () => const DesingsView(),
        (reference) => DesingDetailsView(
          reference: reference,
        ),
      );
    },
    desings: (_) => const DesingsView(),
  };
}

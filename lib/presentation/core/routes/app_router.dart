import 'package:cv_desing_website_flutter/presentation/views/auth/auth_view.dart';
import 'package:cv_desing_website_flutter/presentation/views/coming_soon/coming_soon_view.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_details/desing_details_view.dart';
import 'package:cv_desing_website_flutter/presentation/views/desings/desings_view.dart';
import 'package:cv_desing_website_flutter/presentation/views/home/home_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String initial = '/';
  static const String blog = '/blog';
  static const String home = '/home';
  static const String desings = '/desings';
  static const String details = '/details';
  static const String auth = '/auth';
  static Map<String, WidgetBuilder> routes = {
    // '': (context) => const ComingSoonPage(),
    initial: (context) => const HomeView(),
    home: (context) => const HomeView(),
    blog: (context) => const ComingSoonView(),
    auth: (context) => const AuthView(),
    details: (context) => const DesingDetailsView(),
    desings: (context) => DesingsView(),
  };
  static Map<String, Widget Function()> routesMap = {
    initial: () => const HomeView(),
    home: () => const HomeView(),
    blog: () => const ComingSoonView(),
    auth: () => const AuthView(),
    details: () => const DesingDetailsView(),
    desings: () => DesingsView(),
  };
}

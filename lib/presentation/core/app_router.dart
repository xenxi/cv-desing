import 'package:cv_desing_website_flutter/presentation/auth/auth_page.dart';
import 'package:cv_desing_website_flutter/presentation/coming_soon/coming_soon_page.dart';
import 'package:cv_desing_website_flutter/presentation/desing_details/desing_details_page.dart';
import 'package:cv_desing_website_flutter/presentation/desings/desings_page.dart';
import 'package:cv_desing_website_flutter/presentation/home/home_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static String none = '/';
  static String blog = '/blog';
  static String home = '/preview';
  static String desings = '/desings';
  static String details = '/details';
  static String auth = '/auth';
  static Map<String, WidgetBuilder> routes = {
    // '': (context) => const ComingSoonPage(),
    none: (context) => const HomeView(),
    home: (context) => const HomeView(),
    blog: (context) => const ComingSoonPage(),
    auth: (context) => const AuthPage(),
    details: (context) => const DesingDetailsPage(),
    desings: (context) => DesingsPage(),
  };
  static Map<String, Widget Function()> routesMap = {
    '/': () => const HomeView(),
    home: () => const HomeView(),
    blog: () => const ComingSoonPage(),
    auth: () => const AuthPage(),
    details: () => const DesingDetailsPage(),
    desings: () => DesingsPage(),
  };
}

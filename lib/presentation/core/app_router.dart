import 'package:cv_desing_website_flutter/presentation/coming_soon/coming_soon_page.dart';
import 'package:cv_desing_website_flutter/presentation/desing_details/desing_details_page.dart';
import 'package:cv_desing_website_flutter/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static String blog = '/blog';
  static String home = '/preview';
  static String details = '/details';
  static Map<String, WidgetBuilder> routes = {
    // '': (context) => const ComingSoonPage(),
    '/': (context) => const HomePage(),
    home: (context) => const HomePage(),
    blog: (context) => const ComingSoonPage(),
    details: (context) => const DesingDetailsPage(),
  };
}

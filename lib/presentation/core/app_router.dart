import 'package:cv_desing_website_flutter/presentation/coming_soon/coming_soon_page.dart';
import 'package:cv_desing_website_flutter/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    // '': (context) => const ComingSoonPage(),
    '/': (context) => const ComingSoonPage(),
    '/preview': (context) => const HomePage(),
  };
}
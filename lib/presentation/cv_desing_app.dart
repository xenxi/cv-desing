import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:flutter/material.dart';

import 'coming_soon/coming_soon_page.dart';
import 'core/router.dart';
import 'home/home_page.dart';

class CvDesingApp extends StatelessWidget {
  const CvDesingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseños CV',
      home: const HomePage(),
      routes: AppRouter.routes,
      theme: CustomTheme.lightTheme,
    );
  }
}

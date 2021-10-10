import 'package:cv_desing_website_flutter/presentation/portfolio/portfolio_page.dart';
import 'package:cv_desing_website_flutter/presentation/theme.dart';
import 'package:flutter/material.dart';

import 'coming_soon/coming_soon_page.dart';

class CvDesingApp extends StatelessWidget {
  const CvDesingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseños CV',
      home: const ComingSoonPage(),
      theme: CustomTheme.lightTheme,
    );
  }
}

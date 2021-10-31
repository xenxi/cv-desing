import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/page_not_found.dart';
import 'package:flutter/material.dart';
import 'core/app_router.dart';

class CvDesingApp extends StatelessWidget {
  const CvDesingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños CV',
      initialRoute: '/',
      routes: AppRouter.routes,
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (_) => const PageNotFound()),
      theme: CustomTheme.lightTheme,
    );
  }
}

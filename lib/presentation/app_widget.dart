import 'package:cv_desing_website_flutter/presentation/portfolio/portfolio_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Diseños CV',
      home: PortfolioPage(),
    );
  }
}

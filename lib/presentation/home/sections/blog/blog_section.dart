import 'package:cv_desing_website_flutter/presentation/coming_soon/coming_soon_page.dart';
import 'package:cv_desing_website_flutter/presentation/home/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Section(
          isMobile: sizingInformation.isMobile,
          child: const ComingSoonPage(),
        );
      },
    );
  }
}

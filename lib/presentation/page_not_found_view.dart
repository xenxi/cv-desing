import 'package:cv_desing_website_flutter/presentation/shared/components/adaptative_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/not_found.dart';
import 'package:flutter/material.dart';

class PageNotFoundView extends StatelessWidget {
  const PageNotFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightOfScreen(context),
      width: widthOfScreen(context),
      child: const NotFound(),
    );
  }
}

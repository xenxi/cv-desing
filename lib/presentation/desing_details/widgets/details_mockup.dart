import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';

class DetailMockUp extends StatelessWidget {
  const DetailMockUp({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return _buildImage();
  }

  Widget _buildImage() {
    return Container(
      decoration: const BoxDecoration(
          color: CustomTheme.secondaryColor,
          image: DecorationImage(
            image: AssetImage(
              ImagePath.bg11,
            ),
            fit: BoxFit.cover,
          )),
      child: Center(
        child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(2.0, 1.0), //(x,y)
                  blurRadius: 8.0,
                ),
              ],
            ),
            child: child),
      ),
    );
  }
}

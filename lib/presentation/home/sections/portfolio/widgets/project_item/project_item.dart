import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectItem extends HookWidget {
  static final BorderRadius _cardBorderRadius = BorderRadius.circular(10);
  static final Color _textColor = Colors.white;
  final String title;

  final String subtitle;

  final String imageUrl;

  final double width;

  final double height;
  final double? bannerHeight;
  const ProjectItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.bannerHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);
    return InkWell(
      onHover: (val) => isHover.value = val,
      onTap: () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOutCubicEmphasized,
        width: isHover.value ? width + 120 : width,
        decoration: BoxDecoration(
            color: CustomTheme.secondaryColor,
            borderRadius: _cardBorderRadius,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 20),
                blurRadius: 20,
                color: Colors.black.withOpacity(isHover.value ? .4 : 0),
              )
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProjectImage(context),
            if (isHover.value)
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: CustomTheme.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      subtitle,
                      style: TextStyle(color: _textColor),
                    ),
                    SizedBox(
                      height: CustomTheme.defaultPadding / 2,
                    ),
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(height: 1.5, color: _textColor),
                    ),
                    SizedBox(height: CustomTheme.defaultPadding),
                    Text(
                      "View Details",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: _textColor),
                    )
                  ],
                ),
              )
            // Expanded(child: child)
          ],
        ),
      ),
    );
  }

  Widget _buildProjectImage(BuildContext context) => ClipRRect(
        borderRadius: _cardBorderRadius,
        child: Image.asset(
          imageUrl,
          width: width,
          // height: height,
          fit: BoxFit.fitWidth,
          alignment: Alignment.center,
        ),
      );
}

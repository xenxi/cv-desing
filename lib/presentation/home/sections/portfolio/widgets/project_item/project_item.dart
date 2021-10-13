import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectItem extends HookWidget {
  static final BorderRadius _cardBorderRadius = BorderRadius.circular(10);
  static final Color _textColor = Colors.white;
  final String title;

  final String subtitle;

  final String imageUrl;

  const ProjectItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
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
        width: isHover.value ? 500 : 300,
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
        child: _buildItemV2(context, isHover),
      ),
    );
  }

  Stack _buildItemV2(BuildContext context, ValueNotifier<bool> isHover) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildProjectImage(context),
        if (isHover.value)
          Positioned(
            right: -50,
            top: 0,
            child: ZoomIn(
              child: Container(
                width: 100,
                height: double.infinity,
                color: Colors.red,
              ),
            ),
          )
      ],
    );
  }

  Row _buildItem(BuildContext context, ValueNotifier<bool> isHover) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProjectImage(context),
        if (isHover.value)
          Container(
            color: Colors.red,
            padding:
                EdgeInsets.symmetric(horizontal: CustomTheme.defaultPadding),
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
                      decoration: TextDecoration.underline, color: _textColor),
                )
              ],
            ),
          )
        // Expanded(child: child)
      ],
    );
  }

  Widget _buildProjectImage(BuildContext context) => ClipRRect(
        borderRadius: _cardBorderRadius,
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      );
}

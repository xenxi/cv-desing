import 'package:animate_do/animate_do.dart';
import 'package:cv_desing_website_flutter/presentation/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
      child: ResponsiveBuilder(
          builder: (BuildContext context, SizingInformation sizingInformation) {
        return ClipRRect(
          borderRadius: _cardBorderRadius,
          child: _buildItem(context,
              isHover: isHover.value, size: sizingInformation.localWidgetSize),
        );
      }),
    );
  }

  Widget _buildItem(BuildContext context,
      {required bool isHover, required Size size}) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        _buildProjectImage(context),
        if (isHover)
          Align(
            alignment: Alignment.bottomCenter,
            child: FlipInX(
              child: Container(
                width: size.width,
                height: size.height,
                color: CustomTheme.secondaryColor.withOpacity(.8),
                child: _buildTextInfo(context),
              ),
            ),
          )
      ],
    );
  }

  Widget _buildTextInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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

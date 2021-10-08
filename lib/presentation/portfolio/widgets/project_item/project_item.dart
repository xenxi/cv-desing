import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectItem extends HookWidget {
  static final BorderRadius _cardBorderRadius = BorderRadius.circular(10);
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
        duration: const Duration(microseconds: 300),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: _cardBorderRadius,
          boxShadow: isHover.value
              ? [
                  BoxShadow(
                    offset: const Offset(0, 20),
                    blurRadius: 50,
                    color: Colors.black.withOpacity(0.1),
                  )
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: _cardBorderRadius,
          child: Row(
            children: [
              _buildProjectImage(context),
              // Expanded(child: child)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectImage(BuildContext context) => Image.asset(
        imageUrl,
        // width: width,
        height: height,
        fit: BoxFit.fitHeight,
        alignment: Alignment.topCenter,
      );
}

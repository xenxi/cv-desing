import 'package:flutter/material.dart';

class ProjectItem extends StatelessWidget {
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
    return MouseRegion(
      onEnter: (_) => {},
      onExit: (_) => {},
      child: Stack(
        children: [
          _buildProjectImage(context),
        ],
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

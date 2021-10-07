import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/domain/curriculum.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';

class ProjectCategoryData {
  final String title;
  final int number;
  bool isSelected;

  ProjectCategoryData({
    required this.title,
    required this.number,
    this.isSelected = false,
  });
}

class GalleryWidget extends StatelessWidget {
  final List<Curriculum> curriculumsData;

  final List<ProjectCategoryData> projectCategories;
  const GalleryWidget({
    Key? key,
    required this.curriculumsData,
    required this.projectCategories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.red),
      width: widthOfScreen(context),
      height: heightOfScreen(context),
      child: ListView(
        children: [
          Wrap(
            spacing: 20,
            runSpacing: 16,
            children:
                _buildProjectCategories(context, categories: projectCategories),
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: assignWidth(context: context, fraction: 0.0099),
            runSpacing: assignHeight(context: context, fraction: 0.02),
            children: _buildItems(context),
          )
        ],
      ),
    );
  }

  List<Widget> _buildProjectCategories(BuildContext context,
      {required List<ProjectCategoryData> categories}) {
    List<Widget> items = [];
    final hoverColor = Theme.of(context).primaryColor;

    for (int index = 0; index < categories.length; index++) {
      items.add(
        ProjectCategory(
          title: categories[index].title,
          number: categories[index].number,
          isSelected: categories[index].isSelected,
          onTap: () => {},
          hoverColor: hoverColor,
        ),
      );
    }
    return items;
  }

  List<Widget> _buildItems(BuildContext context) {
    return curriculumsData.map((cv) => _buildItem(context, data: cv)).toList();
  }

  Widget _buildItem(BuildContext context, {required Curriculum data}) =>
      Container(
        height: 400,
        width: 500,
        child: Stack(
          children: [
            Image.asset(
              data.url,
              width: 500,
              height: 400,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            )
          ],
        ),
      );
}

class ProjectCategory extends StatefulWidget {
  const ProjectCategory({
    Key? key,
    required this.title,
    this.titleColor = Colors.black,
    this.numberColor = Colors.transparent,
    this.titleStyle,
    required this.number,
    required this.hoverColor,
    this.numberStyle,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final String title;
  final Color titleColor;
  final Color numberColor;
  final TextStyle? titleStyle;
  final int number;
  final Color hoverColor;
  final TextStyle? numberStyle;
  final GestureTapCallback? onTap;
  final bool isSelected;

  @override
  _ProjectCategoryState createState() => _ProjectCategoryState();
}

class _ProjectCategoryState extends State<ProjectCategory>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController _controller;
  late Color color;

  @override
  void initState() {
    super.initState();
    color = widget.titleColor;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: InkWell(
        onTap: widget.onTap,
        hoverColor: Colors.transparent,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.title,
                style: widget.titleStyle?.copyWith(
                      color: colorOfCategory(),
                    ) ??
                    textTheme.subtitle1?.copyWith(
                      fontSize: 16,
                      color: colorOfCategory(),
                    ),
              ),
              WidgetSpan(
                child: widget.isSelected
                    ? numberOfProjectItems()
                    : FadeTransition(
                        opacity: _controller.view,
                        child: numberOfProjectItems(),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget numberOfProjectItems() {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Transform.translate(
      offset: const Offset(2, -8),
      child: Text(
        "(${widget.number})",
        textScaleFactor: 0.7,
        style: widget.numberStyle?.copyWith(
              color: widget.hoverColor,
            ) ??
            textTheme.subtitle1?.copyWith(
              fontSize: 16,
              color: widget.hoverColor,
            ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
    if (hovering) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  Color colorOfSuperScript() {
    if (_isHovering) {
      return widget.hoverColor;
    } else if (widget.isSelected) {
      return widget.hoverColor;
    } else {
      return widget.numberColor;
    }
  }

  Color colorOfCategory() {
    if (_isHovering) {
      return widget.hoverColor;
    } else if (widget.isSelected) {
      return widget.hoverColor;
    } else {
      return widget.titleColor;
    }
  }
}

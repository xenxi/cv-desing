import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/section_extensions.dart';
import 'package:flutter/material.dart';

class StepTitle extends StatelessWidget {
  const StepTitle({
    Key? key,
    required this.section,
    required this.selected,
    required this.onTap,
  }) : super(key: key);
  final Section section;
  final bool selected;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: selected ? Colors.white24 : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: CustomTheme.primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: section.icon,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    section.displayName,
                    style: const TextStyle(color: CustomTheme.primaryText1),
                  ),
                )
              ],
            ),
          ),
          if (Section.values.indexOf(section) < Section.values.length - 1)
            Transform.scale(
              scaleY: 2,
              child: Container(
                padding: const EdgeInsets.only(left: 17),
                height: 20,
                child: const VerticalDivider(
                  thickness: 3,
                  color: CustomTheme.primaryColor,
                ),
              ),
            )
        ],
      ),
    );
  }
}

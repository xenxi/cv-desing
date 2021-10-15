import 'package:cv_desing_website_flutter/presentation/shared/animated_hover_indicator.dart';
import 'package:cv_desing_website_flutter/presentation/shared/select_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NavItem extends HookWidget {
  static const double indicatorWidth = 60;
  final String title;
  final TextStyle? titleStyle;
  final Color titleColor;
  final bool isSelected;
  final GestureTapCallback? onTap;

  const NavItem({
    Key? key,
    required this.title,
    this.titleStyle,
    this.titleColor = Colors.black,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);
    return MouseRegion(
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            isSelected
                ? const Positioned(
                    top: 12,
                    child: SelectedIndicator(
                      width: indicatorWidth,
                    ),
                  )
                : Positioned(
                    top: 12,
                    child: AnimatedHoverIndicator(
                      isHover: isHover.value,
                      width: indicatorWidth,
                    ),
                  ),
            Text(
              title,
              style: titleStyle ??
                  Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 16,
                        color: titleColor,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.height,
    this.minHeight = 0,
    this.color,
    this.onTap,
  }) : super(key: key);

  final double height;
  final double minHeight;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final imgLogo = Image(
      height: height < minHeight ? minHeight : height,
      image: AssetImage(height > 200 ? ImagePath.logo : ImagePath.logoXs),
      fit: BoxFit.contain,
    );

    final logoWithColor = color != null ? _applyColor(imgLogo) : imgLogo;

    return onTap != null
        ? InkWell(onTap: onTap, child: logoWithColor)
        : logoWithColor;
  }

  Widget _applyColor(Image logo) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [color!, color!],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: logo,
    );
  }
}

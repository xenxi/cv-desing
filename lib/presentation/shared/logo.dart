import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';

class Logo extends StatelessWidget {
  final double height;
  final double minHeight;
  final Color? color;
  final void Function() onTap;
  const Logo({
    Key? key,
    required this.height,
    this.minHeight = 0,
    this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imgLogo = Image(
      height: height < minHeight ? minHeight : height,
      image: const AssetImage('assets/img/logo.png'),
      fit: BoxFit.contain,
    );

    if (color != null) return _applyColor(imgLogo);

    return InkWell(onTap: onTap, child: imgLogo);
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

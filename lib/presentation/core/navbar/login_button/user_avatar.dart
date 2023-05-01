import 'package:cv_desing_website_flutter/domain/value_objects/url.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    this.radius,
    required this.avatarUrl,
  }) : super(key: key);
  final Url avatarUrl;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: avatarUrl.fold(
          (_) => const Icon(Icons.person),
          (a) => FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: ImagePath.logo,
            image: a,
          ),
        ),
      ),
    );
  }
}

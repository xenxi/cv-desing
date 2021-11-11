import 'package:cv_desing_website_flutter/domain/url.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    this.radius,
    required this.avatarUrl,
  }) : super(key: key);
  final Option<Url> avatarUrl;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: avatarUrl.fold(
          () => const Icon(Icons.person),
          (a) => FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: ImagePath.loader,
            image: a.value,
          ),
        ),
      ),
    );
  }
}

import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/category_extensions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key? key,
    required this.category,
    required this.url,
  }) : super(key: key);
  final Category category;

  final String url;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: shareDesing,
      icon: const Icon(
        Icons.share,
        color: Colors.black,
      ),
      label: const Text(
        Location.share,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Future<void> shareDesing() => Share.share(
        Location.shareMessage(category, url),
        subject: 'Te puede interesar este ${category.displayName}',
      );
}

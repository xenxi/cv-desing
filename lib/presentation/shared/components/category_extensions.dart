import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';

extension CategoryExtension on Category {
  String get displayName {
    switch (this) {
      case Category.curriculum:
        return Location.curriculum;
      case Category.flyer:
        return Location.flyer;
      case Category.businessCard:
        return Location.businessCard;
    }

    // ignore: dead_code
    return toString();
  }
}

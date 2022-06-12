import 'package:cv_desing_website_flutter/domain/value_objects/languages.dart';

extension LanguageLevelExtension on LanguageLevel {
  String get displayName {
    switch (this) {
      case LanguageLevel.beginner:
        return 'Básico';
      case LanguageLevel.intermediate:
        return 'Intermedio';
      case LanguageLevel.native:
        return 'Nativo';
    }

    // ignore: dead_code
    return toString();
  }
}

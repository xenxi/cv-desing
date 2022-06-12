import 'package:cv_desing_website_flutter/domain/value_objects/languages.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/percentage.dart';

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
  }

  double get percentage =>
      (LanguageLevel.values.indexOf(this) + 1) / LanguageLevel.values.length;
}

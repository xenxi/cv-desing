import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

enum LanguageLevel {
  beginner,
  intermediate,
  advanced,
}

class Language extends ValueObject<String> {
  factory Language(String title,
          {LanguageLevel level = LanguageLevel.beginner}) =>
      Language._(validateStringIsNotEmpty(title), level: level);
  factory Language.empty() => Language('');
  const Language._(this.value, {required this.level});
  @override
  final Either<Failure<String>, String> value;
  final LanguageLevel level;
}

class Languages extends Equatable {
  const Languages(this.value);
  factory Languages.empty() => const Languages([]);

  final List<Language> value;
  @override
  List<Object?> get props => [...value];

  Languages add(Language language) =>
      Languages(List<Language>.from(value)..add(language));

  Languages remove(Language language) => Languages(
        List<Language>.from(value)..remove(language),
      );
}

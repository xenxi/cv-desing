import 'package:cv_desing_website_flutter/domain/value_object.dart';

class Language extends ValueObject {
  const Language(this.value, {this.level = ''});

  final String value;
  final String level;

  @override
  List<Object?> get props => [value];
}

class Languages extends ValueObject {
  factory Languages.empty() => const Languages([]);
  const Languages(this.value);

  final List<Language> value;
  @override
  List<Object?> get props => [...value];

  Languages add(Language language) =>
      Languages(List<Language>.from(value)..add(language));

  Languages remove(Language language) => Languages(
        List<Language>.from(value)..remove(language),
      );
}

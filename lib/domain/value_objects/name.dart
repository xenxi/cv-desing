import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';

class Name extends ValueObject<String> {
  const Name._(this.value);

  factory Name(String name) {
    return Name._(validateStringIsNotEmpty(name));
  }
  factory Name.empty() => Name('');
  @override
  final Either<Failure<String>, String> value;
}

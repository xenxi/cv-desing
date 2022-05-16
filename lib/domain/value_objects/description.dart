import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';

class Description extends ValueObject<String> {
  const Description._(this.value);

  factory Description(String description) {
    return Description._(validateStringIsNotEmpty(description));
  }
  factory Description.empty() => Description('');
  @override
  final Either<Failure<String>, String> value;
}

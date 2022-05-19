import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';

class Location extends ValueObject<String> {
  const Location._(this.value);

  factory Location(String location) {
    return Location._(validateStringIsNotEmpty(location));
  }
  factory Location.empty() => Location('');
  @override
  final Either<Failure<String>, String> value;
}

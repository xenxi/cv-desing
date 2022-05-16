import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';

class Employer extends ValueObject<String> {
  const Employer._(this.value);

  factory Employer(String employer) {
    return Employer._(validateStringIsNotEmpty(employer));
  }
  factory Employer.empty() => Employer('');
  @override
  final Either<Failure<String>, String> value;
}

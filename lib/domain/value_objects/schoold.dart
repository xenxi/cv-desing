import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';

class Schoold extends ValueObject<String> {
  const Schoold._(this.value);

  factory Schoold(String schoold) {
    return Schoold._(validateStringIsNotEmpty(schoold));
  }
  factory Schoold.empty() => Schoold('');
  @override
  final Either<Failure<String>, String> value;
}

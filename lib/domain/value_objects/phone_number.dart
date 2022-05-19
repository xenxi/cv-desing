import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';

class PhoneNumber extends ValueObject<String> {
  const PhoneNumber._(this.value);

  factory PhoneNumber(String phoneNumber) {
    return PhoneNumber._(validateStringIsNotEmpty(phoneNumber));
  }
  factory PhoneNumber.empty() => PhoneNumber('');
  @override
  final Either<Failure<String>, String> value;
}

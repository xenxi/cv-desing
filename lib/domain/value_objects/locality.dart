import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';

class Locality extends ValueObject<String> {
  const Locality._(this.value);

  factory Locality(String localityStr) {
    return Locality._(validateStringIsNotEmpty(localityStr));
  }
  factory Locality.empty() => Locality('');
  @override
  final Either<Failure<String>, String> value;
}

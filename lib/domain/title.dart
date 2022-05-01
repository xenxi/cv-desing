import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';

class Title extends ValueObject<String> {
  const Title._(this.value);

  factory Title(String title) {
    return Title._(validateStringIsNotEmpty(title));
  }
  factory Title.empty() => Title('');
  @override
  final Either<Failure<String>, String> value;
}

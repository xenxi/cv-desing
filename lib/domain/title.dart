import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';

class Title extends ValueObject {
  const Title._(this.value);

  factory Title(String input) {
    return Title._(input);
  }

  static Either<Failure<String>, Title> create(String input) =>
      validateStringIsNotEmpty(input).bind((a) => right(Title._(a)));

  static Either<Failure<String>, Title> empty() => create('');

  final String value;

  @override
  List<Object?> get props => [value];
}

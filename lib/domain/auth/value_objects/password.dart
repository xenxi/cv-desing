import 'package:cv_desing_website_flutter/domain/auth/failures/password_failures.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:dartz/dartz.dart';

class Password extends ValueObject<String> {
  factory Password(String value) => Password._(_validatePassword(value));

  const Password._(this.value);
  factory Password.empty() => Password('');
  @override
  final Either<Failure<String>, String> value;

  static Either<Failure<String>, String> _validatePassword(String value) {
    if (value.isEmpty) return left(InvalidPasswordFailure(failedValue: value));
    return right(value);
  }
}

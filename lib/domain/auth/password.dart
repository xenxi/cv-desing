import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_object.dart';
import 'package:dartz/dartz.dart';

import 'failures/password_failures.dart';

class Password extends ValueObject {
  final String value;

  Password._(this.value);

  static Either<Failure, Password> create(String value) {
    return _validatePassword(value).bind((a) => right(Password._(a)));
  }

  @override
  List<Object?> get props => [value];

  static Either<Failure, String> _validatePassword(String value) {
    if (value.isEmpty) return left(InvalidPasswordFailure(failedValue: value));
    return right(value);
  }
}

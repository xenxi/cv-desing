import 'package:dartz/dartz.dart';

class EmailAddress {
  final String value;
  EmailAddress._(
    this.value,
  );

  static Either<Failure, EmailAddress> create(String input) {
    return _validateEmailAddress(input).bind((a) => right(EmailAddress._(a)));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmailAddress && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'EmailAddress($value)';

  static Either<Failure, String> _validateEmailAddress(String input) {
    const emailRegex =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (!RegExp(emailRegex).hasMatch(input)) {
      return left(InvalidEmailFailure(failedValue: input));
    }

    return right(input);
  }
}

abstract class Failure {}

class InvalidEmailFailure implements Failure {
  final String failedValue;
  InvalidEmailFailure({
    required this.failedValue,
  });
}

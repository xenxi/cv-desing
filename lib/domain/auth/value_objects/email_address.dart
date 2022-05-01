import 'package:cv_desing_website_flutter/domain/auth/failures/email_address_failure.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_object.dart';
import 'package:dartz/dartz.dart';

class EmailAddress extends ValueObject<String> {
  factory EmailAddress(String input) =>
      EmailAddress._(_validateEmailAddress(input));
  factory EmailAddress.empty() => EmailAddress('');

  const EmailAddress._(this.value);
  @override
  final Either<Failure<String>, String> value;

  @override
  String toString() => 'EmailAddress($value)';

  static Either<Failure<String>, String> _validateEmailAddress(String input) {
    const emailRegex =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (!RegExp(emailRegex).hasMatch(input)) {
      return left(InvalidEmailFailure(failedValue: input));
    }

    return right(input);
  }
}

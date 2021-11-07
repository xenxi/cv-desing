import 'package:cv_desing_website_flutter/domain/auth/failures/email_address_failure.dart';
import 'package:dartz/dartz.dart';
import '../../failure.dart';
import '../../value_object.dart';

class EmailAddress extends ValueObject {
  EmailAddress._(
    this.value,
  );

  final String value;

  static Either<Failure, EmailAddress> create(String input) {
    return _validateEmailAddress(input).bind((a) => right(EmailAddress._(a)));
  }

  static Either<Failure, EmailAddress> empty() {
    return create('');
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

  @override
  List<Object?> get props => [value];
}

import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthFailure extends Failure<Unit> {
  const AuthFailure() : super(unit);

  factory AuthFailure.serverError() => const ServerError._();
  factory AuthFailure.emailAlreadyInUse() => const EmailAlreadyInUse._();
  factory AuthFailure.cancelledByUser() => const CancelledByUser._();

  factory AuthFailure.invalidEmailAndPasswordCombination() =>
      const InvalidEmailAndPasswordCombination._();
}

class CancelledByUser extends AuthFailure {
  const CancelledByUser._() : super();
}

class InvalidEmailAndPasswordCombination extends AuthFailure {
  const InvalidEmailAndPasswordCombination._() : super();
}

class ServerError extends AuthFailure {
  const ServerError._() : super();
}

class EmailAlreadyInUse extends AuthFailure {
  const EmailAlreadyInUse._() : super();
}

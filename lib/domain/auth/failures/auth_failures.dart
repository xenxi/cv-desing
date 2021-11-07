import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthFailure extends Failure<Unit> {
  const AuthFailure() : super(unit);

  static ServerError serverError() => const ServerError._();
  static CancelledByUser cancelledByUser() => const CancelledByUser._();

  static InvalidEmailAndPasswordCombination
      invalidEmailAndPasswordCombination() =>
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

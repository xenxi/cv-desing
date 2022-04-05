import 'package:cv_desing_website_flutter/domain/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class Failure<T> extends Equatable {
  const Failure(this.failedValue);

  final T failedValue;

  @override
  List<Object?> get props => [failedValue];

  @override
  bool get stringify => true;
}

extension MonadFailureExtension<T> on Either<Failure, T> {
  T getOrCrash() => fold((f) => throw UnexpectedValueError(f), id);
  bool isValid() => isRight();
}

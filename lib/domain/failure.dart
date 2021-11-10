import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'errors.dart';

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

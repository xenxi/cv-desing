import 'package:cv_desing_website_flutter/domain/errors.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ValueObject<T> extends Equatable {
  const ValueObject();
  Either<Failure<T>, T> get value;
  T getOrCrash() {
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  B fold<B>(B Function(Failure<T> l) ifLeft, B Function(T r) ifRight) =>
      value.fold(ifLeft, ifRight);
  bool isValid() => value.isRight();
  @override
  List<Object?> get props => [value];

  Either<Failure, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  String toString() => value.fold((l) => '$l', (r) => '$r');
}

import 'package:cv_desing_website_flutter/domain/errors.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ValueObject extends Equatable {
  const ValueObject();
}

extension ValueObjectExtension<T> on Either<Failure, T> {
  T getOrCrash() {
    return fold((f) => throw UnexpectedValueError(f), id);
  }
}

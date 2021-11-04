import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ValueObject extends Equatable {}

abstract class Failure {}

class InvalidEmailFailure implements Failure {
  final String failedValue;
  InvalidEmailFailure({
    required this.failedValue,
  });
}

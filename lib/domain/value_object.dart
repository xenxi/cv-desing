import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ValueObject extends Equatable {
  const ValueObject();
}

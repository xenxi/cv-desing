import 'package:equatable/equatable.dart';

abstract class Failure<T> extends Equatable {
  final T failedValue;

  const Failure(this.failedValue);

  @override
  List<Object?> get props => [failedValue];
}

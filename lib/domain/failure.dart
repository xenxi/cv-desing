import 'package:equatable/equatable.dart';

class Failure<T> extends Equatable {
  final T failedValue;

  const Failure(this.failedValue);

  @override
  List<Object?> get props => [failedValue];

  @override
  bool get stringify => true;
}

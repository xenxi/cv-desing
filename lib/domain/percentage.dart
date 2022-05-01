import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_object.dart';
import 'package:dartz/dartz.dart';

class Percentage extends ValueObject<double> {
  factory Percentage(double percentage) =>
      Percentage._(_validatePercentage(percentage));
  factory Percentage.empty() => Percentage(0);
  const Percentage._(this.value);
  @override
  final Either<Failure<double>, double> value;

  static Either<Failure<double>, double> _validatePercentage(
    double percentage,
  ) {
    if (percentage < 0 || percentage > 100) {
      return left(InvalidPercentageFailure(percentage));
    }
    return right(percentage);
  }
}

class InvalidPercentageFailure extends Failure<double> {
  const InvalidPercentageFailure(double failedValue) : super(failedValue);
}

import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_failures.dart';
import 'package:dartz/dartz.dart';

Either<Failure<String>, String> validateStringIsNotEmpty(String? input) {
  if (input?.isNotEmpty == true) {
    return right(input!);
  } else {
    return left(Empty<String>());
  }
}

Either<Failure<DateTime>, DateTime> validateDateIsNotEmpty(DateTime? input) {
  if (input != null) {
    return right(input);
  }
  return left(Empty<DateTime>());
}

Either<Failure<DateTime>, DateTime> validateMaxDateValue(
  DateTime input,
  DateTime maxDate,
) {
  if (input.isAfter(maxDate)) {
    return right(input);
  }
  return left(ExceedingMaxDate(input));
}

Either<Failure<DateTime>, DateTime> validateMinDateValue(
  DateTime input,
  DateTime minDate,
) {
  if (input.isBefore(minDate)) {
    return right(input);
  }
  return left(ExceedingMinDate(input));
}

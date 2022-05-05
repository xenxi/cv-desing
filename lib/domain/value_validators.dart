import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_failures.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:dartz/dartz.dart';

Either<Failure<String>, String> validateStringIsNotEmpty(String? input) {
  if (input?.isNotEmpty == true) {
    return right(input!);
  } else {
    return left(const Empty<String>());
  }
}

Either<Failure<DateTime>, DateTime> validateDateIsNotEmpty(DateTime? input) {
  if (input != null) {
    return right(input);
  }
  return left(const Empty<DateTime>());
}

Either<Failure<DateTime>, DateTime> validateMaxDateValue(
  DateTime input,
  DateTime maxDate,
) {
  if (input.isBefore(maxDate)) {
    return right(input);
  }
  return left(ExceedingMaxDate(input));
}

Either<Failure<RangeOfDates>, RangeOfDates> validateMaxInitialDateRangeValue(
  DateTime since,
  DateTime? until,
  DateTime maxDate,
) {
  final range = RangeOfDates(since, until);
  return validateMaxDateValue(since, maxDate)
      .fold((_) => left(ExceedingMaxStartDate(range)), (r) => right(range));
}

Either<Failure<RangeOfDates>, RangeOfDates> validateMinInitialDateRangeValue(
  DateTime since,
  DateTime? until,
  DateTime maxDate,
) {
  final range = RangeOfDates(since, until);
  return validateMinDateValue(since, maxDate)
      .fold((_) => left(ExceedingMinStartDate(range)), (r) => right(range));
}

Either<Failure<DateTime>, DateTime> validateMinDateValue(
  DateTime input,
  DateTime minDate,
) {
  if (input.isAfter(minDate)) {
    return right(input);
  }
  return left(ExceedingMinDate(input));
}

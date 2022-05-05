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

Either<Failure<RangeOfDates>, RangeOfDates> validateDateRangeIsNotEmpty(
  DateTime? since,
  DateTime? until,
) =>
    validateDateIsNotEmpty(since).fold(
      (l) => left(const Empty<RangeOfDates>()),
      (r) => right(RangeOfDates(r, until)),
    );

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
  RangeOfDates range,
  DateTime maxDate,
) =>
    validateMaxDateValue(range.since, maxDate)
        .fold((_) => left(ExceedingMaxStartDate(range)), (r) => right(range));

Either<Failure<RangeOfDates>, RangeOfDates> validateMinInitialDateRangeValue(
  RangeOfDates range,
  DateTime maxDate,
) =>
    validateMinDateValue(range.since, maxDate)
        .fold((_) => left(ExceedingMinStartDate(range)), (_) => right(range));
Either<Failure<RangeOfDates>, RangeOfDates> validateMinEndDateRangeValue(
  RangeOfDates range,
) =>
    range.until.fold(
      () => right(range),
      (u) => validateMinDateValue(u, range.since)
          .fold((_) => left(InvalidEndDate(range)), (_) => right(range)),
    );

Either<Failure<DateTime>, DateTime> validateMinDateValue(
  DateTime input,
  DateTime minDate,
) {
  if (input.isAfter(minDate)) {
    return right(input);
  }
  return left(ExceedingMinDate(input));
}

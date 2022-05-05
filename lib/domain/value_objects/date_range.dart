import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_failures.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class RangeOfDates extends Equatable {
  RangeOfDates(this.since, DateTime? until) : until = optionOf(until);

  final DateTime since;
  final Option<DateTime> until;

  @override
  List<Object?> get props => [since, until];
}

class DateRange extends ValueObject<RangeOfDates> {
  factory DateRange.empty() => DateRange(since: null, until: null);
  factory DateRange({required DateTime? since, required DateTime? until}) =>
      DateRange._(validate(since, until));
  const DateRange._(this.value);
  static final maxDate = DateTime.now().add(const Duration(days: 30));
  static final minDate = DateTime(DateTime.now().year - 100);
  @override
  final Either<Failure<RangeOfDates>, RangeOfDates> value;

  static Either<Failure<RangeOfDates>, RangeOfDates> validate(
    DateTime? since,
    DateTime? until,
  ) {
    return validateDateRangeIsNotEmpty(since, until).flatMap(
      (range) => validateMinInitialDateRangeValue(
        range,
        minDate,
      ).flatMap(
        (range) => validateMaxInitialDateRangeValue(
          range,
          maxDate,
        ),
      ),
    );
  }
}

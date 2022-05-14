import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';

class Empty<T> extends Failure<T> {
  const Empty() : super(null);
}

class ExceedingMinNumber extends Failure<int> {
  const ExceedingMinNumber(int number) : super(number);
}

class ExceedingMaxDate extends Failure<DateTime> {
  const ExceedingMaxDate(DateTime date) : super(date);
}

class ExceedingMinDate extends Failure<DateTime> {
  const ExceedingMinDate(DateTime date) : super(date);
}

class ExceedingMinStartDate extends Failure<RangeOfDates> {
  const ExceedingMinStartDate(RangeOfDates date) : super(date);
}

class ExceedingMaxStartDate extends Failure<RangeOfDates> {
  const ExceedingMaxStartDate(RangeOfDates date) : super(date);
}

class InvalidEndDate extends Failure<RangeOfDates> {
  const InvalidEndDate(RangeOfDates date) : super(date);
}

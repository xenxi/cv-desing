import 'package:cv_desing_website_flutter/domain/failure.dart';

class Empty<T> extends Failure<T> {
  const Empty() : super(null);
}

class ExceedingMaxDate extends Failure<DateTime> {
  const ExceedingMaxDate(DateTime date) : super(date);
}

class ExceedingMinDate extends Failure<DateTime> {
  const ExceedingMinDate(DateTime date) : super(date);
}

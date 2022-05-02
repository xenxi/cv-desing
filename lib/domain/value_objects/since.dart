import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';

class Since extends ValueObject<DateTime> {
  const Since._(this.value);
  factory Since(DateTime? since) => Since._(_validate(since));
  static final maxDate = DateTime.now().add(const Duration(days: 30));
  static final minDate = DateTime(DateTime.now().year - 100);
  @override
  final Either<Failure<DateTime>, DateTime> value;

  static Either<Failure<DateTime>, DateTime> _validate(DateTime? since) =>
      validateDateIsNotEmpty(since)
          .flatMap(
            (since) => validateMaxDateValue(
              since,
              maxDate,
            ),
          )
          .flatMap(
            (since) => validateMinDateValue(
              since,
              minDate,
            ),
          );
}

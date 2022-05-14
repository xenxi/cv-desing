import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';

class CourseHours extends ValueObject<int> {
  factory CourseHours.emtpy() => CourseHours(0);
  const CourseHours._(this.value);
  factory CourseHours(int courseHours) {
    return CourseHours._(validateMinNumberValue(courseHours, minValue));
  }
  static const minValue = 0;
  @override
  final Either<Failure<int>, int> value;
}

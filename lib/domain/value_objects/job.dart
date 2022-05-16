import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';

class Job extends ValueObject<String> {
  const Job._(this.value);

  factory Job(String job) {
    return Job._(validateStringIsNotEmpty(job));
  }
  factory Job.empty() => Job('');
  @override
  final Either<Failure<String>, String> value;
}

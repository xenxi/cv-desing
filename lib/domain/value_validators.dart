import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_failures.dart';
import 'package:dartz/dartz.dart';

Either<Failure<String>, String> validateStringIsNotEmpty(String? input) {
  if (input?.isNotEmpty == true) {
    return right(input!);
  } else {
    return left(const Empty());
  }
}

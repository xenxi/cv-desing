import 'package:cv_desing_website_flutter/domain/failure.dart';

class InvalidUrlFailure extends Failure<String> {
  const InvalidUrlFailure({
    required String failedValue,
  }) : super(failedValue);
}

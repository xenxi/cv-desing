import 'package:cv_desing_website_flutter/domain/failure.dart';

class InvalidEmailFailure extends Failure<String> {
  const InvalidEmailFailure({
    required String failedValue,
  }) : super(failedValue);
}

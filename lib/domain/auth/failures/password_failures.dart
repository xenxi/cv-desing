import 'package:cv_desing_website_flutter/domain/failure.dart';

class InvalidPasswordFailure extends Failure<String> {
  const InvalidPasswordFailure({required String failedValue})
      : super(failedValue);
}

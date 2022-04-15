import 'package:cv_desing_website_flutter/domain/failure.dart';

class DesingNotFound extends Failure<String> {
  const DesingNotFound(String failedValue) : super(failedValue);
}

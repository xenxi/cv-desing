import '../../failure.dart';

class InvalidUrlFailure extends Failure<String> {
  const InvalidUrlFailure({
    required String failedValue,
  }) : super(failedValue);
}

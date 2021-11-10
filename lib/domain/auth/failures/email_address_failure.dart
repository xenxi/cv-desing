import '../../failure.dart';

class InvalidEmailFailure extends Failure<String> {
  const InvalidEmailFailure({
    required String failedValue,
  }) : super(failedValue);
}

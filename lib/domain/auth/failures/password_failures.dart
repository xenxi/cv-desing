import '../../failure.dart';

class InvalidPasswordFailure extends Failure<String> {
  const InvalidPasswordFailure({required String failedValue})
      : super(failedValue);
}

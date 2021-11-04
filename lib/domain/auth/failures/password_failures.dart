import '../../failure.dart';

class InvalidPasswordFailure implements Failure {
  final String failedValue;

  InvalidPasswordFailure({required this.failedValue});
}

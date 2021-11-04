import '../failure.dart';

class InvalidEmailFailure implements Failure {
  final String failedValue;
  InvalidEmailFailure({
    required this.failedValue,
  });
}

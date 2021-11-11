import 'package:dartz/dartz.dart';

import 'auth/failures/url_failure.dart';
import 'failure.dart';
import 'value_object.dart';

class Url extends ValueObject {
  @override
  const Url._(this.value);

  static Either<Failure, Url> create(String input) {
    return _validateUrl(input).bind((a) => right(Url._(a)));
  }

  static Either<Failure, Url> empty() {
    return create('');
  }

  final String value;

  static Either<InvalidUrlFailure, String> _validateUrl(String input) {
    const urlRegex =
        r"(http|ftp|https)://([\w+?\.\w+])+([a-zA-Z0-9\~\!\@\#\$\%\^\&\*\(\)_\-\=\+\\\/\?\.\:\;\'\,]*)?";
    if (RegExp(urlRegex).hasMatch(input)) {
      return right(input);
    } else {
      return left(InvalidUrlFailure(failedValue: input));
    }
  }

  @override
  List<Object?> get props => [value];
}

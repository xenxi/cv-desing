import 'package:cv_desing_website_flutter/domain/auth/failures/url_failure.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_object.dart';
import 'package:dartz/dartz.dart';

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

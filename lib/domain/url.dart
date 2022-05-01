import 'package:cv_desing_website_flutter/domain/auth/failures/url_failure.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';

class Url extends ValueObject<String> {
  const Url._(this.value);

  factory Url(String? input) {
    return Url._(
      _validate(input),
    );
  }

  factory Url.empty() {
    return Url('');
  }
  @override
  final Either<Failure<String>, String> value;

  static Either<Failure<String>, String> _validate(String? input) =>
      validateStringIsNotEmpty(input).flatMap(_validateUrl);

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

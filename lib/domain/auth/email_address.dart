class EmailAddress {
  final String value;
  EmailAddress._(
    this.value,
  );
  factory EmailAddress(String input) {
    return EmailAddress._(_validateEmailAddress(input));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmailAddress && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'EmailAddress($value)';

  static String _validateEmailAddress(String input) {
    const emailRegex =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (RegExp(emailRegex).hasMatch(input)) return input;

    throw InvalidEmailException(failedValue: input);
  }
}

class InvalidEmailException implements Exception {
  final String failedValue;
  InvalidEmailException({
    required this.failedValue,
  });
}

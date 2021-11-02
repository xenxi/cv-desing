class EmailAddress {
  final String value;
  EmailAddress({
    required this.value,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmailAddress && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'EmailAddress($value)';
}

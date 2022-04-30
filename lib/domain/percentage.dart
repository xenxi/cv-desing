import 'package:cv_desing_website_flutter/domain/value_object.dart';

class Percentage extends ValueObject {
  const Percentage(this.value);

  final double value;
  @override
  List<Object?> get props => [value];
}

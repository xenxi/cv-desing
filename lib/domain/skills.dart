import 'package:cv_desing_website_flutter/domain/value_object.dart';
import 'package:equatable/equatable.dart';

class Skills extends Equatable {
  factory Skills.empty() => const Skills(<String>[]);
  const Skills(this.value);

  final List<String> value;
  @override
  List<Object?> get props => [...value];

  Skills add(String skill) => Skills(List<String>.from(value)..add(skill));

  Skills remove(String skill) => Skills(
        List<String>.from(value)..remove(skill),
      );
}

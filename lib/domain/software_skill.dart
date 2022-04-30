import 'package:cv_desing_website_flutter/domain/percentage.dart';
import 'package:cv_desing_website_flutter/domain/value_object.dart';

class SoftwareSkill extends ValueObject {
  const SoftwareSkill(this.value, {this.percentage = const Percentage(0)});

  final String value;
  final Percentage percentage;

  @override
  List<Object?> get props => [value];
}

class SoftwareSkills extends ValueObject {
  factory SoftwareSkills.empty() => const SoftwareSkills([]);
  const SoftwareSkills(this.value);

  final List<SoftwareSkill> value;
  @override
  List<Object?> get props => [...value];

  SoftwareSkills add(SoftwareSkill skill) =>
      SoftwareSkills(List<SoftwareSkill>.from(value)..add(skill));

  SoftwareSkills remove(SoftwareSkill skill) => SoftwareSkills(
        List<SoftwareSkill>.from(value)..remove(skill),
      );
}
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/percentage.dart';
import 'package:cv_desing_website_flutter/domain/value_object.dart';
import 'package:cv_desing_website_flutter/domain/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SoftwareSkill extends ValueObject<String> {
  const SoftwareSkill._(
    this.value, {
    required this.percentage,
  });
  factory SoftwareSkill(String title, {Percentage? percentage}) =>
      SoftwareSkill._(
        validateStringIsNotEmpty(title),
        percentage: percentage ?? Percentage.empty(),
      );
  factory SoftwareSkill.empty() => SoftwareSkill('');

  @override
  final Either<Failure<String>, String> value;

  final Percentage percentage;
}

class SoftwareSkills extends Equatable {
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

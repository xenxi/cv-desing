import 'package:cv_desing_website_flutter/domain/title.dart';
import 'package:equatable/equatable.dart';

class AcademyTraining extends Equatable {
  const AcademyTraining({
    required this.title,
    required this.schoold,
    required this.since,
    this.until,
  });
  factory AcademyTraining.empty() => AcademyTraining(
        title: Title.empty(),
        schoold: '',
        since: DateTime(2022),
      );
  final Title title;
  final String schoold;
  final DateTime since;
  final DateTime? until;

  @override
  List<Object?> get props => [
        title,
        schoold,
        since,
        until,
      ];

  AcademyTraining copyWith({
    Title? title,
    String? schoold,
    DateTime? since,
    DateTime? until,
  }) {
    return AcademyTraining(
      title: title ?? this.title,
      schoold: schoold ?? this.schoold,
      since: since ?? this.since,
      until: until ?? this.until,
    );
  }
}

class AcademyTrainings extends Equatable {
  factory AcademyTrainings.empty() => const AcademyTrainings([]);
  const AcademyTrainings(this.value);

  final List<AcademyTraining> value;
  @override
  List<Object?> get props => [...value];

  AcademyTrainings add(AcademyTraining skill) =>
      AcademyTrainings(List<AcademyTraining>.from(value)..add(skill));

  AcademyTrainings remove(AcademyTraining skill) => AcademyTrainings(
        List<AcademyTraining>.from(value)..remove(skill),
      );
}

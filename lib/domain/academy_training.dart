import 'package:cv_desing_website_flutter/domain/value_object.dart';

class AcademyTraining extends ValueObject {
  const AcademyTraining({
    required this.title,
    required this.schoold,
    required this.since,
    this.until,
  });
  final String title;
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
}

class AcademyTrainings extends ValueObject {
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

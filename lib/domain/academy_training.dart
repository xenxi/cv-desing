import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:equatable/equatable.dart';

class AcademyTraining extends Equatable {
  const AcademyTraining({
    required this.title,
    required this.schoold,
    required this.dateRange,
  });
  factory AcademyTraining.empty() => AcademyTraining(
        title: Title.empty(),
        schoold: '',
        dateRange: DateRange.empty(),
      );
  final Title title;
  final String schoold;
  final DateRange dateRange;

  @override
  List<Object?> get props => [
        title,
        schoold,
        dateRange,
      ];

  AcademyTraining copyWith({
    Title? title,
    String? schoold,
    DateRange? dateRange,
  }) {
    return AcademyTraining(
      title: title ?? this.title,
      schoold: schoold ?? this.schoold,
      dateRange: dateRange ?? this.dateRange,
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

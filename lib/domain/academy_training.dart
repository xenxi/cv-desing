import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/schoold.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AcademyTraining extends Equatable {
  const AcademyTraining({
    required this.title,
    required this.schoold,
    required this.dateRange,
    required this.uniqueId,
  });
  factory AcademyTraining.empty() => AcademyTraining(
        title: Title.empty(),
        schoold: Schoold.empty(),
        dateRange: DateRange.empty(),
        uniqueId: UniqueId(),
      );
  final Title title;
  final Schoold schoold;
  final DateRange dateRange;
  final UniqueId uniqueId;

  @override
  List<Object?> get props => [
        title,
        schoold,
        dateRange,
        uniqueId,
      ];

  AcademyTraining copyWith({
    Title? title,
    Schoold? schoold,
    DateRange? dateRange,
    UniqueId? uniqueId,
  }) {
    return AcademyTraining(
      title: title ?? this.title,
      schoold: schoold ?? this.schoold,
      dateRange: dateRange ?? this.dateRange,
      uniqueId: uniqueId ?? this.uniqueId,
    );
  }

  Option<Failure> get failureOption => title.failureOrUnit
      .andThen(schoold.failureOrUnit)
      .andThen(dateRange.failureOrUnit)
      .andThen(schoold.failureOrUnit)
      .fold((l) => some(l), (_) => none());
}

class AcademyTrainings extends Equatable {
  factory AcademyTrainings.empty() => const AcademyTrainings([]);
  const AcademyTrainings(this.value);

  final List<AcademyTraining> value;
  @override
  List<Object?> get props => [...value];

  AcademyTrainings add(AcademyTraining skill) => AcademyTrainings(
        List<AcademyTraining>.from(value)
          ..removeWhere((element) => element.uniqueId == skill.uniqueId)
          ..add(skill),
      );

  AcademyTrainings remove(AcademyTraining skill) => AcademyTrainings(
        List<AcademyTraining>.from(value)..remove(skill),
      );
}

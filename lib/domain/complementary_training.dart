import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/course_hours.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/schoold.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/unique_id.dart';

class ComplementaryTraining extends Equatable {
  const ComplementaryTraining({
    required this.title,
    required this.schoold,
    required this.dateRange,
    required this.uniqueId,
    required this.courseHoursOption,
  });
  factory ComplementaryTraining.empty() => ComplementaryTraining(
        title: Title.empty(),
        schoold: Schoold.empty(),
        dateRange: DateRange.empty(),
        uniqueId: UniqueId(),
        courseHoursOption: none(),
      );
  final Title title;
  final Schoold schoold;
  final DateRange dateRange;
  final UniqueId uniqueId;
  final Option<CourseHours> courseHoursOption;

  @override
  List<Object?> get props =>
      [title, schoold, dateRange, uniqueId, courseHoursOption];

  ComplementaryTraining copyWith({
    Title? title,
    Schoold? schoold,
    DateRange? dateRange,
    UniqueId? uniqueId,
    Option<CourseHours>? courseHoursOption,
  }) {
    return ComplementaryTraining(
      title: title ?? this.title,
      schoold: schoold ?? this.schoold,
      dateRange: dateRange ?? this.dateRange,
      uniqueId: uniqueId ?? this.uniqueId,
      courseHoursOption: courseHoursOption ?? this.courseHoursOption,
    );
  }

  Option<Failure> get failureOption => title.failureOrUnit
      .andThen(schoold.failureOrUnit)
      .andThen(dateRange.failureOrUnit)
      .andThen(schoold.failureOrUnit)
      .fold((l) => some(l), (_) => none());
}

class ComplementaryTrainings extends Equatable {
  factory ComplementaryTrainings.empty() => const ComplementaryTrainings([]);
  const ComplementaryTrainings(this.value);

  final List<ComplementaryTraining> value;
  @override
  List<Object?> get props => [...value];

  ComplementaryTrainings add(ComplementaryTraining skill) =>
      ComplementaryTrainings(
        List<ComplementaryTraining>.from(value)
          ..removeWhere((element) => element.uniqueId == skill.uniqueId)
          ..add(skill),
      );

  ComplementaryTrainings remove(ComplementaryTraining skill) =>
      ComplementaryTrainings(
        List<ComplementaryTraining>.from(value)..remove(skill),
      );
}

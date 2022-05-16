import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/description.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/employer.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class WorkExperience extends Equatable {
  const WorkExperience(
      {required this.job,
      required this.employer,
      required this.dateRange,
      required this.uniqueId,
      required this.description});
  factory WorkExperience.empty() => WorkExperience(
        job: Job.empty(),
        employer: Employer.empty(),
        dateRange: DateRange.empty(),
        uniqueId: UniqueId(),
        description: Description.empty(),
      );
  final Job job;
  final Employer employer;
  final DateRange dateRange;
  final UniqueId uniqueId;
  final Description description;

  @override
  List<Object?> get props => [
        job,
        employer,
        dateRange,
        uniqueId,
        description,
      ];

  Option<Failure> get failureOption => job.failureOrUnit
      .andThen(employer.failureOrUnit)
      .andThen(dateRange.failureOrUnit)
      .andThen(description.failureOrUnit)
      .andThen(uniqueId.failureOrUnit)
      .fold((l) => some(l), (_) => none());
}

class WorkExperiences extends Equatable {
  const WorkExperiences(this.value);
  factory WorkExperiences.empty() => const WorkExperiences([]);

  final List<WorkExperience> value;
  @override
  List<Object?> get props => [...value];

  WorkExperiences add(WorkExperience skill) => WorkExperiences(
        List<WorkExperience>.from(value)
          ..removeWhere((element) => element.uniqueId == skill.uniqueId)
          ..add(skill),
      );

  WorkExperiences remove(WorkExperience skill) => WorkExperiences(
        List<WorkExperience>.from(value)..remove(skill),
      );
}

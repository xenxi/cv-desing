import 'dart:typed_data';

import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/description.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/locality.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/name.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PersonalInformation extends Equatable {
  factory PersonalInformation.empty() => PersonalInformation(
        name: Name.empty(),
        locality: Locality.empty(),
        job: Job.empty(),
        description: Description.empty(),
        avatarOption: none(),
      );
  const PersonalInformation({
    required this.name,
    required this.locality,
    required this.job,
    required this.avatarOption,
    required this.description,
  });
  final Option<Uint8List> avatarOption;
  final Name name;
  final Locality locality;
  final Job job;
  final Description description;
  @override
  List<Object?> get props => [
        name,
        locality,
        job,
        description,
        avatarOption,
      ];

  PersonalInformation copyWith({
    Option<Uint8List>? avatarOption,
    Name? name,
    Locality? locality,
    Job? job,
    Description? description,
  }) {
    return PersonalInformation(
      avatarOption: avatarOption ?? this.avatarOption,
      name: name ?? this.name,
      locality: locality ?? this.locality,
      job: job ?? this.job,
      description: description ?? this.description,
    );
  }

  Option<Failure> get failureOption => name.failureOrUnit
      .andThen(locality.failureOrUnit)
      .andThen(job.failureOrUnit)
      .andThen(description.failureOrUnit)
      .fold((l) => some(l), (_) => none());
}

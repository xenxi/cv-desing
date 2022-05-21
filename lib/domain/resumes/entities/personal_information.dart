import 'package:cv_desing_website_flutter/domain/value_objects/description.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/locality.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/name.dart';
import 'package:equatable/equatable.dart';

class PersonalInformation extends Equatable {
  factory PersonalInformation.empty() => PersonalInformation(
        name: Name.empty(),
        locality: Locality.empty(),
        job: Job.empty(),
        description: Description.empty(),
      );
  const PersonalInformation(
      {required this.name,
      required this.locality,
      required this.job,
      required this.description});

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
      ];

  PersonalInformation copyWith({
    Name? name,
    Locality? locality,
    Job? job,
    Description? description,
  }) {
    return PersonalInformation(
      name: name ?? this.name,
      locality: locality ?? this.locality,
      job: job ?? this.job,
      description: description ?? this.description,
    );
  }
}

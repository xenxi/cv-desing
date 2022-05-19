import 'package:cv_desing_website_flutter/domain/value_objects/description.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/location.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/name.dart';
import 'package:equatable/equatable.dart';

class PersonalInformation extends Equatable {
  const PersonalInformation(
      this.name, this.location, this.job, this.description);

  final Name name;
  final Location location;
  final Job job;
  final Description description;
  @override
  List<Object?> get props => [
        name,
        location,
        job,
        description,
      ];
}

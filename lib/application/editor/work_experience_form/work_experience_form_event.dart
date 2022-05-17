part of 'work_experience_form_bloc.dart';

abstract class WorkExperienceFormEvent extends Equatable {
  const WorkExperienceFormEvent();
}

class JobChanged extends WorkExperienceFormEvent {
  const JobChanged(this.job);

  final String job;

  @override
  List<Object?> get props => [job];
}

class DateRangeChanged extends WorkExperienceFormEvent {
  const DateRangeChanged({this.since, this.until});

  final DateTime? since;
  final DateTime? until;

  @override
  List<Object?> get props => [since, until];
}

class EmployerChanged extends WorkExperienceFormEvent {
  const EmployerChanged(this.employer);

  final String employer;

  @override
  List<Object?> get props => [employer];
}

class DescriptionChanged extends WorkExperienceFormEvent {
  const DescriptionChanged(this.description);

  final String description;

  @override
  List<Object?> get props => [description];
}

class Initialized extends WorkExperienceFormEvent {
  const Initialized(this.workExperienceOption);

  final Option<WorkExperience> workExperienceOption;

  @override
  List<Object?> get props => [workExperienceOption];
}

class Saved extends WorkExperienceFormEvent {
  @override
  List<Object?> get props => [];
}

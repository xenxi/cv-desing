part of 'academy_training_form_bloc.dart';

abstract class AcademyTrainingFormEvent extends Equatable {
  const AcademyTrainingFormEvent();
}

class TitleChanged extends AcademyTrainingFormEvent {
  const TitleChanged(this.title);

  final String title;

  @override
  List<Object?> get props => [title];
}

class Initialized extends AcademyTrainingFormEvent {
  const Initialized(this.ademyTraining);

  final Option<AcademyTraining> ademyTraining;

  @override
  List<Object?> get props => [ademyTraining];
}

class SchooldChanged extends AcademyTrainingFormEvent {
  const SchooldChanged(this.shoold);

  final String shoold;

  @override
  List<Object?> get props => [shoold];
}

class DateRangeChanged extends AcademyTrainingFormEvent {
  const DateRangeChanged({this.since, this.until});

  final DateTime? since;
  final DateTime? until;

  @override
  List<Object?> get props => [since, until];
}

class Saved extends AcademyTrainingFormEvent {
  @override
  List<Object?> get props => [];
}

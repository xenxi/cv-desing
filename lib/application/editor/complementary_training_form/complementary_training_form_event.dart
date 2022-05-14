part of 'complementary_training_form_bloc.dart';

abstract class ComplementaryTrainingFormEvent extends Equatable {
  const ComplementaryTrainingFormEvent();
}

class TitleChanged extends ComplementaryTrainingFormEvent {
  const TitleChanged(this.title);

  final String title;

  @override
  List<Object?> get props => [title];
}

class Initialized extends ComplementaryTrainingFormEvent {
  const Initialized(this.ademyTraining);

  final Option<ComplementaryTraining> ademyTraining;

  @override
  List<Object?> get props => [ademyTraining];
}

class SchooldChanged extends ComplementaryTrainingFormEvent {
  const SchooldChanged(this.shoold);

  final String shoold;

  @override
  List<Object?> get props => [shoold];
}

class DateRangeChanged extends ComplementaryTrainingFormEvent {
  const DateRangeChanged({this.since, this.until});

  final DateTime? since;
  final DateTime? until;

  @override
  List<Object?> get props => [since, until];
}

class Saved extends ComplementaryTrainingFormEvent {
  @override
  List<Object?> get props => [];
}

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

part of 'academy_training_form_bloc.dart';

class AcademyTrainingFormState extends Equatable {
  factory AcademyTrainingFormState.initial() => AcademyTrainingFormState(
        title: Title.empty(),
      );
  const AcademyTrainingFormState({
    required this.title,
  });
  final Title title;

  @override
  List<Object> get props => [title];

  AcademyTrainingFormState copyWith({
    Title? title,
  }) {
    return AcademyTrainingFormState(
      title: title ?? this.title,
    );
  }
}
